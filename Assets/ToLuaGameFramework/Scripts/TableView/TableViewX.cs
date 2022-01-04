using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;
using UnityEngine.SocialPlatforms;
using UnityEngine.UI;

namespace ToLuaGameFramework.Tacticsoft
{
    public delegate TableViewCell TableViewXCellFun(TableViewX tv, int col);
    public delegate int TableViewXIntFun(TableViewX tv);
    public delegate float TableViewXFloatFun(TableViewX tv, int col);
    public class TableViewX : MonoBehaviour
    {

        private TableViewXIntFun m_NumberOfColsForTableView;
        private TableViewXFloatFun m_WidthForColInTableView;
        private TableViewXCellFun m_CellForColInTableView;

        public bool HaveEvents()
        {
            return m_NumberOfColsForTableView != null || m_WidthForColInTableView != null || m_CellForColInTableView != null;
        }
        public void SetNumberOfColsForTableView(TableViewXIntFun fun)
        {
            m_NumberOfColsForTableView = fun;
        }

        public void SetWidthForColInTableView(TableViewXFloatFun fun)
        {
            m_WidthForColInTableView = fun;
        }

        public void SetCellForColInTableView(TableViewXCellFun fun)
        {
            m_CellForColInTableView = fun;
        }


        #region Public API
        /// <summary>
        /// The data source that will feed this table view with information. Required.
        /// </summary>
        
        [System.Serializable]
        public class CellVisibilityChangeEvent : UnityEvent<int, bool> { }
        /// <summary>
        /// This event will be called when a cell's visibility changes
        /// First param (int) is the col index, second param (bool) is whether or not it is visible
        /// </summary>
        public CellVisibilityChangeEvent onCellVisibilityChanged;

        /// <summary>
        /// Get a cell that is no longer in use for reusing
        /// </summary>
        /// <param name="reuseIdentifier">The identifier for the cell type</param>
        /// <returns>A prepared cell if available, null if none</returns>
        public TableViewCell GetReusableCell(string reuseIdentifier)
        {
            LinkedList<TableViewCell> cells;
            if (!m_reusableCells.TryGetValue(reuseIdentifier, out cells))
            {
                return null;
            }
            if (cells.Count == 0)
            {
                return null;
            }
            TableViewCell cell = cells.First.Value;
            cells.RemoveFirst();
            return cell;
        }

        public bool isEmpty { get; private set; }

        /// <summary>
        /// Reload the table view. Manually call this if the data source changed in a way that alters the basic layout
        /// (number of cols changed, etc)
        /// </summary>
        public void ReloadData()
        {
            if (m_NumberOfColsForTableView == null || m_WidthForColInTableView == null) return;
            m_colWidths = new float[m_NumberOfColsForTableView(this)]; // m_dataSource.GetNumberOfColsForTableView(this)
            this.isEmpty = m_colWidths.Length == 0;
            if (this.isEmpty)
            {
                ClearAllClos();
                return;
            }
            m_cumulativeColWidths = new float[m_colWidths.Length];
            m_cleanCumulativeIndex = -1;

            for (int i = 0; i < m_colWidths.Length; i++)
            {
                m_colWidths[i] = m_WidthForColInTableView(this, i);
                if (i > 0)
                {
                    m_colWidths[i] += m_horizontalLayoutGroup.spacing;
                }
            }

            m_scrollRect.content.sizeDelta = new Vector2(GetCumulativeColWidths(m_colWidths.Length - 1), m_scrollRect.content.sizeDelta[1]);

            RecalculateVisibleColsFromScratch();
            m_requiresReload = false;
        }

        /// <summary>
        /// Get cell at a specific col (if active). Returns null if not.
        /// </summary>
        public TableViewCell GetCellAtCol(int col)
        {
            TableViewCell retVal = null;
            m_visibleCells.TryGetValue(col, out retVal);
            return retVal;
        }

        /// <summary>
        /// Get the range of the currently visible cols
        /// </summary>
        public Range visibleColRange
        {
            get { return m_visibleColRange; }
        }

        /// <summary>
        /// Notify the table view that one of its cols changed size
        /// </summary>
        public void NotifyCellDimensionsChanged(int col)
        {
            if (m_WidthForColInTableView == null) return;
            float oldWidth = m_colWidths[col];
            m_colWidths[col] = m_WidthForColInTableView(this, col);
            m_cleanCumulativeIndex = Mathf.Min(m_cleanCumulativeIndex, col - 1);
            if (m_visibleColRange.Contains(col))
            {
                TableViewCell cell = GetCellAtCol(col);
                cell.GetComponent<LayoutElement>().preferredWidth = m_colWidths[col];
                if (col > 0)
                {
                    cell.GetComponent<LayoutElement>().preferredWidth -= m_horizontalLayoutGroup.spacing;
                }
            }
            float widthDelta = m_colWidths[col] - oldWidth;
            m_scrollRect.content.sizeDelta = new Vector2(m_scrollRect.content.sizeDelta.x + widthDelta, m_scrollRect.content.sizeDelta.y);
            m_requiresRefresh = true;
        }

        /// <summary>
        /// Get the maximum scrollable width of the table. scrollY property will never be more than this.
        /// </summary>
        public float scrollableWidth
        {
            get
            {
                return m_scrollRect.content.rect.width - (this.transform as RectTransform).rect.width;
            }
        }

        /// <summary>
        /// Get or set the current scrolling position of the table
        /// </summary>
        public float scrollY
        {
            get
            {
                return m_scrollY;
            }
            set
            {
                if (this.isEmpty)
                {
                    return;
                }
                value = Mathf.Clamp(value, 0, GetScrollYForCol(m_colWidths.Length - 1, true));
                if (m_scrollY != value)
                {
                    m_scrollY = value;
                    m_requiresRefresh = true;
                    float relativeScroll = value / this.scrollableWidth;
                    m_scrollRect.verticalNormalizedPosition = relativeScroll;
                }
            }
        }

        /// <summary>
        /// Get the y that the table would need to scroll to to have a certain col at the top
        /// </summary>
        /// <param name="col">The desired col</param>
        /// <param name="above">Should the top of the table be above the col or below the col?</param>
        /// <returns>The y position to scroll to, can be used with scrollY property</returns>
        public float GetScrollYForCol(int col, bool above)
        {
            float retVal = GetCumulativeColWidths(col);
            if (above)
            {
                retVal -= m_colWidths[col];
            }
            return retVal;
        }

        #endregion

        #region Private implementation

        private ITableViewDataSource m_dataSource;
        public bool m_requiresReload;

        private HorizontalLayoutGroup m_horizontalLayoutGroup;
        private ScrollRect m_scrollRect;
        private LayoutElement m_topPadding;
        private LayoutElement m_bottomPadding;

        private float[] m_colWidths;
        private float[] m_cumulativeColWidths;
        private int m_cleanCumulativeIndex;

        private Dictionary<int, TableViewCell> m_visibleCells;
        private Range m_visibleColRange;

        private RectTransform m_reusableCellContainer;
        private Dictionary<string, LinkedList<TableViewCell>> m_reusableCells;

        private float m_scrollY;

        public bool m_requiresRefresh;

        private void ScrollViewValueChanged(Vector2 newScrollValue)
        {
            float relativeScroll = newScrollValue.x;
            m_scrollY = relativeScroll * scrollableWidth;
            m_requiresRefresh = true;
            //Debug.Log(m_scrollY.ToString(("0.00")));
        }

        private void RecalculateVisibleColsFromScratch()
        {
            ClearAllClos();
            SetInitialVisibleCols();
        }

        private void ClearAllClos()
        {
            while (m_visibleCells.Count > 0)
            {
                HideCol(false);
            }
            m_visibleColRange = new Range(0, 0);
        }

        void Awake()
        {
            isEmpty = true;
            m_scrollRect = GetComponent<ScrollRect>();
            m_horizontalLayoutGroup = GetComponentInChildren<HorizontalLayoutGroup>();
            m_topPadding = CreateEmptyPaddingElement("TopPadding");
            m_topPadding.transform.SetParent(m_scrollRect.content, false);
            m_bottomPadding = CreateEmptyPaddingElement("Bottom");
            m_bottomPadding.transform.SetParent(m_scrollRect.content, false);
            m_visibleCells = new Dictionary<int, TableViewCell>();

            m_reusableCellContainer = new GameObject("ReusableCells", typeof(RectTransform)).GetComponent<RectTransform>();
            m_reusableCellContainer.SetParent(this.transform, false);
            m_reusableCellContainer.gameObject.SetActive(false);
            m_reusableCells = new Dictionary<string, LinkedList<TableViewCell>>();
        }

        void Update()
        {
            if (m_requiresReload)
            {
                ReloadData();
            }
        }

        void LateUpdate()
        {
            if (m_requiresRefresh)
            {
                RefreshVisibleCols();
            }
        }

        void OnEnable()
        {
            m_scrollRect.onValueChanged.AddListener(ScrollViewValueChanged);
        }

        void OnDisable()
        {
            m_scrollRect.onValueChanged.RemoveListener(ScrollViewValueChanged);
        }

        private Range CalculateCurrentVisibleColRange()
        {
            float startY = m_scrollY;
            float endY = m_scrollY + (this.transform as RectTransform).rect.width;
            int startIndex = FindIndexOfColAtX(startY);
            int endIndex = FindIndexOfColAtX(endY);
            return new Range(startIndex, endIndex - startIndex + 1);
        }

        private void SetInitialVisibleCols()
        {
            Range visibleCols = CalculateCurrentVisibleColRange();
            for (int i = 0; i < visibleCols.count; i++)
            {
                AddCol(visibleCols.from + i, true);
            }
            m_visibleColRange = visibleCols;
            UpdatePaddingElements();
        }

        private void AddCol(int col, bool atEnd)
        {
            if (m_CellForColInTableView == null) return;
            TableViewCell newCell = m_CellForColInTableView(this, col); // m_dataSource.GetCellForColInTableView(this, col);
            newCell.transform.SetParent(m_scrollRect.content, false);

            LayoutElement layoutElement = newCell.GetComponent<LayoutElement>();
            if (layoutElement == null)
            {
                layoutElement = newCell.gameObject.AddComponent<LayoutElement>();
            }
            layoutElement.preferredWidth = m_colWidths[col];
            if (col > 0)
            {
                layoutElement.preferredWidth -= m_horizontalLayoutGroup.spacing;
            }

            m_visibleCells[col] = newCell;
            if (atEnd)
            {
                newCell.transform.SetSiblingIndex(m_scrollRect.content.childCount - 2); //One before bottom padding
            }
            else
            {
                newCell.transform.SetSiblingIndex(1); //One after the top padding
            }
            this.onCellVisibilityChanged.Invoke(col, true);
        }

        private void RefreshVisibleCols()
        {
            m_requiresRefresh = false;

            if (this.isEmpty)
            {
                return;
            }

            Range newVisibleCols = CalculateCurrentVisibleColRange();
            int oldTo = m_visibleColRange.Last();
            int newTo = newVisibleCols.Last();

            if (newVisibleCols.from > oldTo || newTo < m_visibleColRange.from)
            {
                //We jumped to a completely different segment this frame, destroy all and recreate
                RecalculateVisibleColsFromScratch();
                return;
            }

            //Remove cols that disappeared to the top
            for (int i = m_visibleColRange.from; i < newVisibleCols.from; i++)
            {
                HideCol(false);
            }
            //Remove cols that disappeared to the bottom
            for (int i = newTo; i < oldTo; i++)
            {
                HideCol(true);
            }
            //Add cols that appeared on top
            for (int i = m_visibleColRange.from - 1; i >= newVisibleCols.from; i--)
            {
                AddCol(i, false);
            }
            //Add cols that appeared on bottom
            for (int i = oldTo + 1; i <= newTo; i++)
            {
                AddCol(i, true);
            }
            m_visibleColRange = newVisibleCols;
            UpdatePaddingElements();
        }

        private void UpdatePaddingElements()
        {
            float hiddenElementsWidthSum = 0;
            for (int i = 0; i < m_visibleColRange.from; i++)
            {
                hiddenElementsWidthSum += m_colWidths[i];
            }
            m_topPadding.preferredWidth =  hiddenElementsWidthSum;
            m_topPadding.gameObject.SetActive(m_topPadding.preferredWidth > 0);
            for (int i = m_visibleColRange.from; i <= m_visibleColRange.Last(); i++)
            {
                hiddenElementsWidthSum += m_colWidths[i];
            }
            float bottomPaddingWidth = m_scrollRect.content.rect.width - hiddenElementsWidthSum;
            m_bottomPadding.preferredWidth = bottomPaddingWidth - m_horizontalLayoutGroup.spacing;
            m_bottomPadding.gameObject.SetActive(m_bottomPadding.preferredWidth > 0);
        }

        private void HideCol(bool last)
        {
            //Debug.Log("Hiding col at scroll y " + m_scrollY.ToString("0.00"));

            int col = last ? m_visibleColRange.Last() : m_visibleColRange.from;
            TableViewCell removedCell = m_visibleCells[col];
            StoreCellForReuse(removedCell);
            m_visibleCells.Remove(col);
            m_visibleColRange.count -= 1;
            if (!last)
            {
                m_visibleColRange.from += 1;
            }
            this.onCellVisibilityChanged.Invoke(col, false);
        }

        private LayoutElement CreateEmptyPaddingElement(string name)
        {
            GameObject go = new GameObject(name, typeof(RectTransform), typeof(LayoutElement));
            LayoutElement le = go.GetComponent<LayoutElement>();
            return le;
        }

        private int FindIndexOfColAtX(float x)
        {
            //TODO : Binary search if inside clean cumulative col width area, else walk until found.
            return FindIndexOfColAtX(x, 0, m_cumulativeColWidths.Length - 1);
        }

        private int FindIndexOfColAtX(float x, int startIndex, int endIndex)
        {
            if (startIndex >= endIndex)
            {
                return startIndex;
            }
            int midIndex = (startIndex + endIndex) / 2;
            if (GetCumulativeColWidths(midIndex) >= x)
            {
                return FindIndexOfColAtX(x, startIndex, midIndex);
            }
            else
            {
                return FindIndexOfColAtX(x, midIndex + 1, endIndex);
            }
        }

        private float GetCumulativeColWidths(int col)
        {
            while (m_cleanCumulativeIndex < col)
            {
                m_cleanCumulativeIndex++;
                //Debug.Log("Cumulative index : " + m_cleanCumulativeIndex.ToString());
                m_cumulativeColWidths[m_cleanCumulativeIndex] = m_colWidths[m_cleanCumulativeIndex];
                if (m_cleanCumulativeIndex > 0)
                {
                    m_cumulativeColWidths[m_cleanCumulativeIndex] += m_cumulativeColWidths[m_cleanCumulativeIndex - 1];
                }
            }
            return m_cumulativeColWidths[col];
        }

        private void StoreCellForReuse(TableViewCell cell)
        {
            string reuseIdentifier = cell.reuseIdentifier;

            if (string.IsNullOrEmpty(reuseIdentifier))
            {
                GameObject.Destroy(cell.gameObject);
                return;
            }

            if (!m_reusableCells.ContainsKey(reuseIdentifier))
            {
                m_reusableCells.Add(reuseIdentifier, new LinkedList<TableViewCell>());
            }
            m_reusableCells[reuseIdentifier].AddLast(cell);
            cell.transform.SetParent(m_reusableCellContainer, false);
        }

        #endregion

    }
}