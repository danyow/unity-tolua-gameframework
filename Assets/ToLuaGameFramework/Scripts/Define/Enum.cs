namespace ToLuaGameFramework
{
    /// <summary>
    /// 全局事件枚举
    /// </summary>
    public enum MsgEnum
    {
        /// <summary>
        /// 更新AssetBundle开始
        /// </summary>
        ABLoadingBegin,

        /// <summary>
        /// 更新AssetBundle进度
        /// </summary>
        ABLoadingProgress,

        /// <summary>
        /// 更新AssetBundle出错
        /// </summary>
        ABLoadingError,

        /// <summary>
        /// 更新AssetBundle结束
        /// </summary>
        ABLoadingFinish,

        /// <summary>
        /// 开始执行Lua的Main脚本
        /// </summary>
        RunLua,

    }
}