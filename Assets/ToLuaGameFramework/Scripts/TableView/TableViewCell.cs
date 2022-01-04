using UnityEngine;

namespace ToLuaGameFramework.Tacticsoft
{
    /// <summary>
    /// The base class for cells in a TableView. ITableViewDataSource returns pointers
    /// to these objects
    /// </summary>
    public class TableViewCell : MonoBehaviour
    {
        private string m_key;
        /// <summary>
        /// TableView will cache unused cells and reuse them according to their
        /// reuse identifier. Override this to add custom cache grouping logic.
        /// </summary>
        public virtual string reuseIdentifier
        {
            get
            {
                return m_key;
            }
            set
            {
                m_key = value;
            }
        }
    }
}
