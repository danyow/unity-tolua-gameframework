﻿//this source code was auto-generated by tolua#, do not modify it
using System;
using LuaInterface;

public class LuaFramework_LuaBehaviourWrap
{
	public static void Register(LuaState L)
	{
		L.BeginClass(typeof(LuaFramework.LuaBehaviour), typeof(UnityEngine.MonoBehaviour));
		L.RegFunction("SetEnableAction", SetEnableAction);
		L.RegFunction("SetStartAction", SetStartAction);
		L.RegFunction("SetDisableAction", SetDisableAction);
		L.RegFunction("SetDestroyAction", SetDestroyAction);
		L.RegFunction("__eq", op_Equality);
		L.RegFunction("__tostring", ToLua.op_ToString);
		L.RegVar("assetBundleName", get_assetBundleName, set_assetBundleName);
		L.RegVar("prefabPath", get_prefabPath, set_prefabPath);
		L.RegVar("keepActive", get_keepActive, set_keepActive);
		L.RegVar("isFloat", get_isFloat, set_isFloat);
		L.RegVar("destroyABAfterAllSpawnDestroy", get_destroyABAfterAllSpawnDestroy, set_destroyABAfterAllSpawnDestroy);
		L.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int SetEnableAction(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			LuaFramework.LuaBehaviour obj = (LuaFramework.LuaBehaviour)ToLua.CheckObject<LuaFramework.LuaBehaviour>(L, 1);
			System.Action arg0 = (System.Action)ToLua.CheckDelegate<System.Action>(L, 2);
			obj.SetEnableAction(arg0);
			return 0;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int SetStartAction(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			LuaFramework.LuaBehaviour obj = (LuaFramework.LuaBehaviour)ToLua.CheckObject<LuaFramework.LuaBehaviour>(L, 1);
			System.Action arg0 = (System.Action)ToLua.CheckDelegate<System.Action>(L, 2);
			obj.SetStartAction(arg0);
			return 0;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int SetDisableAction(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			LuaFramework.LuaBehaviour obj = (LuaFramework.LuaBehaviour)ToLua.CheckObject<LuaFramework.LuaBehaviour>(L, 1);
			System.Action arg0 = (System.Action)ToLua.CheckDelegate<System.Action>(L, 2);
			obj.SetDisableAction(arg0);
			return 0;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int SetDestroyAction(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			LuaFramework.LuaBehaviour obj = (LuaFramework.LuaBehaviour)ToLua.CheckObject<LuaFramework.LuaBehaviour>(L, 1);
			System.Action arg0 = (System.Action)ToLua.CheckDelegate<System.Action>(L, 2);
			obj.SetDestroyAction(arg0);
			return 0;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int op_Equality(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			UnityEngine.Object arg0 = (UnityEngine.Object)ToLua.ToObject(L, 1);
			UnityEngine.Object arg1 = (UnityEngine.Object)ToLua.ToObject(L, 2);
			bool o = arg0 == arg1;
			LuaDLL.lua_pushboolean(L, o);
			return 1;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_assetBundleName(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			LuaFramework.LuaBehaviour obj = (LuaFramework.LuaBehaviour)o;
			string ret = obj.assetBundleName;
			LuaDLL.lua_pushstring(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index assetBundleName on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_prefabPath(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			LuaFramework.LuaBehaviour obj = (LuaFramework.LuaBehaviour)o;
			string ret = obj.prefabPath;
			LuaDLL.lua_pushstring(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index prefabPath on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_keepActive(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			LuaFramework.LuaBehaviour obj = (LuaFramework.LuaBehaviour)o;
			bool ret = obj.keepActive;
			LuaDLL.lua_pushboolean(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index keepActive on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_isFloat(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			LuaFramework.LuaBehaviour obj = (LuaFramework.LuaBehaviour)o;
			bool ret = obj.isFloat;
			LuaDLL.lua_pushboolean(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index isFloat on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_destroyABAfterAllSpawnDestroy(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			LuaFramework.LuaBehaviour obj = (LuaFramework.LuaBehaviour)o;
			bool ret = obj.destroyABAfterAllSpawnDestroy;
			LuaDLL.lua_pushboolean(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index destroyABAfterAllSpawnDestroy on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_assetBundleName(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			LuaFramework.LuaBehaviour obj = (LuaFramework.LuaBehaviour)o;
			string arg0 = ToLua.CheckString(L, 2);
			obj.assetBundleName = arg0;
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index assetBundleName on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_prefabPath(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			LuaFramework.LuaBehaviour obj = (LuaFramework.LuaBehaviour)o;
			string arg0 = ToLua.CheckString(L, 2);
			obj.prefabPath = arg0;
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index prefabPath on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_keepActive(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			LuaFramework.LuaBehaviour obj = (LuaFramework.LuaBehaviour)o;
			bool arg0 = LuaDLL.luaL_checkboolean(L, 2);
			obj.keepActive = arg0;
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index keepActive on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_isFloat(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			LuaFramework.LuaBehaviour obj = (LuaFramework.LuaBehaviour)o;
			bool arg0 = LuaDLL.luaL_checkboolean(L, 2);
			obj.isFloat = arg0;
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index isFloat on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_destroyABAfterAllSpawnDestroy(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			LuaFramework.LuaBehaviour obj = (LuaFramework.LuaBehaviour)o;
			bool arg0 = LuaDLL.luaL_checkboolean(L, 2);
			obj.destroyABAfterAllSpawnDestroy = arg0;
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index destroyABAfterAllSpawnDestroy on a nil value");
		}
	}
}

