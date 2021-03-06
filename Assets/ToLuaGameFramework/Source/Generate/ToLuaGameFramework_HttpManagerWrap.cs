//this source code was auto-generated by tolua#, do not modify it
using System;
using LuaInterface;

public class ToLuaGameFramework_HttpManagerWrap
{
	public static void Register(LuaState L)
	{
		L.BeginClass(typeof(ToLuaGameFramework.HttpManager), typeof(UnityEngine.MonoBehaviour));
		L.RegFunction("Get", Get);
		L.RegFunction("Post", Post);
		L.RegFunction("UrlEncode", UrlEncode);
		L.RegFunction("UrlDecode", UrlDecode);
		L.RegFunction("__eq", op_Equality);
		L.RegFunction("__tostring", ToLua.op_ToString);
		L.RegVar("instance", get_instance, set_instance);
		L.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int Get(IntPtr L)
	{
		try
		{
			int count = LuaDLL.lua_gettop(L);

			if (count == 1)
			{
				string arg0 = ToLua.CheckString(L, 1);
				string o = ToLuaGameFramework.HttpManager.Get(arg0);
				LuaDLL.lua_pushstring(L, o);
				return 1;
			}
			else if (count == 2)
			{
				string arg0 = ToLua.CheckString(L, 1);
				LuaFunction arg1 = ToLua.CheckLuaFunction(L, 2);
				ToLuaGameFramework.HttpManager.Get(arg0, arg1);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L, "invalid arguments to method: ToLuaGameFramework.HttpManager.Get");
			}
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int Post(IntPtr L)
	{
		try
		{
			int count = LuaDLL.lua_gettop(L);

			if (count == 2)
			{
				string arg0 = ToLua.CheckString(L, 1);
				LuaTable arg1 = ToLua.CheckLuaTable(L, 2);
				string o = ToLuaGameFramework.HttpManager.Post(arg0, arg1);
				LuaDLL.lua_pushstring(L, o);
				return 1;
			}
			else if (count == 3 && TypeChecker.CheckTypes<string>(L, 3))
			{
				string arg0 = ToLua.CheckString(L, 1);
				LuaTable arg1 = ToLua.CheckLuaTable(L, 2);
				string arg2 = ToLua.ToString(L, 3);
				string o = ToLuaGameFramework.HttpManager.Post(arg0, arg1, arg2);
				LuaDLL.lua_pushstring(L, o);
				return 1;
			}
			else if (count == 3 && TypeChecker.CheckTypes<LuaInterface.LuaFunction>(L, 3))
			{
				string arg0 = ToLua.CheckString(L, 1);
				LuaTable arg1 = ToLua.CheckLuaTable(L, 2);
				LuaFunction arg2 = ToLua.ToLuaFunction(L, 3);
				ToLuaGameFramework.HttpManager.Post(arg0, arg1, arg2);
				return 0;
			}
			else if (count == 4)
			{
				string arg0 = ToLua.CheckString(L, 1);
				LuaTable arg1 = ToLua.CheckLuaTable(L, 2);
				LuaFunction arg2 = ToLua.CheckLuaFunction(L, 3);
				string arg3 = ToLua.CheckString(L, 4);
				ToLuaGameFramework.HttpManager.Post(arg0, arg1, arg2, arg3);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L, "invalid arguments to method: ToLuaGameFramework.HttpManager.Post");
			}
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int UrlEncode(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 1);
			string arg0 = ToLua.CheckString(L, 1);
			string o = ToLuaGameFramework.HttpManager.UrlEncode(arg0);
			LuaDLL.lua_pushstring(L, o);
			return 1;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int UrlDecode(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 1);
			string arg0 = ToLua.CheckString(L, 1);
			string o = ToLuaGameFramework.HttpManager.UrlDecode(arg0);
			LuaDLL.lua_pushstring(L, o);
			return 1;
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
	static int get_instance(IntPtr L)
	{
		try
		{
			ToLua.Push(L, ToLuaGameFramework.HttpManager.instance);
			return 1;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_instance(IntPtr L)
	{
		try
		{
			ToLuaGameFramework.HttpManager arg0 = (ToLuaGameFramework.HttpManager)ToLua.CheckObject<ToLuaGameFramework.HttpManager>(L, 2);
			ToLuaGameFramework.HttpManager.instance = arg0;
			return 0;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}
}

