//this source code was auto-generated by tolua#, do not modify it
using System;
using LuaInterface;

public class ToLuaGameFramework_MessageCenterWrap
{
	public static void Register(LuaState L)
	{
		L.BeginClass(typeof(ToLuaGameFramework.MessageCenter), typeof(System.Object));
		L.RegFunction("Add", Add);
		L.RegFunction("Remove", Remove);
		L.RegFunction("Clear", Clear);
		L.RegFunction("Dispatch", Dispatch);
		L.RegFunction("New", _CreateToLuaGameFramework_MessageCenter);
		L.RegFunction("__tostring", ToLua.op_ToString);
		L.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int _CreateToLuaGameFramework_MessageCenter(IntPtr L)
	{
		try
		{
			int count = LuaDLL.lua_gettop(L);

			if (count == 0)
			{
				ToLuaGameFramework.MessageCenter obj = new ToLuaGameFramework.MessageCenter();
				ToLua.PushObject(L, obj);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L, "invalid arguments to ctor method: ToLuaGameFramework.MessageCenter.New");
			}
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int Add(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			ToLuaGameFramework.MsgEnum arg0 = (ToLuaGameFramework.MsgEnum)ToLua.CheckObject(L, 1, typeof(ToLuaGameFramework.MsgEnum));
			System.Action<ToLuaGameFramework.BaseMsg> arg1 = (System.Action<ToLuaGameFramework.BaseMsg>)ToLua.CheckDelegate<System.Action<ToLuaGameFramework.BaseMsg>>(L, 2);
			ToLuaGameFramework.MessageCenter.Add(arg0, arg1);
			return 0;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int Remove(IntPtr L)
	{
		try
		{
			int count = LuaDLL.lua_gettop(L);

			if (count == 1)
			{
				ToLuaGameFramework.MsgEnum arg0 = (ToLuaGameFramework.MsgEnum)ToLua.CheckObject(L, 1, typeof(ToLuaGameFramework.MsgEnum));
				ToLuaGameFramework.MessageCenter.Remove(arg0);
				return 0;
			}
			else if (count == 2)
			{
				ToLuaGameFramework.MsgEnum arg0 = (ToLuaGameFramework.MsgEnum)ToLua.CheckObject(L, 1, typeof(ToLuaGameFramework.MsgEnum));
				System.Action<ToLuaGameFramework.BaseMsg> arg1 = (System.Action<ToLuaGameFramework.BaseMsg>)ToLua.CheckDelegate<System.Action<ToLuaGameFramework.BaseMsg>>(L, 2);
				ToLuaGameFramework.MessageCenter.Remove(arg0, arg1);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L, "invalid arguments to method: ToLuaGameFramework.MessageCenter.Remove");
			}
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int Clear(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 0);
			ToLuaGameFramework.MessageCenter.Clear();
			return 0;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int Dispatch(IntPtr L)
	{
		try
		{
			int count = LuaDLL.lua_gettop(L);

			if (count == 2 && TypeChecker.CheckTypes<ToLuaGameFramework.BaseMsg>(L, 2))
			{
				ToLuaGameFramework.MsgEnum arg0 = (ToLuaGameFramework.MsgEnum)ToLua.CheckObject(L, 1, typeof(ToLuaGameFramework.MsgEnum));
				ToLuaGameFramework.BaseMsg arg1 = (ToLuaGameFramework.BaseMsg)ToLua.ToObject(L, 2);
				ToLuaGameFramework.MessageCenter.Dispatch(arg0, arg1);
				return 0;
			}
			else if (TypeChecker.CheckTypes<ToLuaGameFramework.MsgEnum>(L, 1) && TypeChecker.CheckParamsType<object>(L, 2, count - 1))
			{
				ToLuaGameFramework.MsgEnum arg0 = (ToLuaGameFramework.MsgEnum)ToLua.CheckObject(L, 1, typeof(ToLuaGameFramework.MsgEnum));
				object[] arg1 = ToLua.ToParamsObject(L, 2, count - 1);
				ToLuaGameFramework.MessageCenter.Dispatch(arg0, arg1);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L, "invalid arguments to method: ToLuaGameFramework.MessageCenter.Dispatch");
			}
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}
}

