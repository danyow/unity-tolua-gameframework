﻿//this source code was auto-generated by tolua#, do not modify it
using System;
using LuaInterface;

public class ToLuaGameFramework_LuaManagerWrap
{
	public static void Register(LuaState L)
	{
		L.BeginClass(typeof(ToLuaGameFramework.LuaManager), typeof(UnityEngine.MonoBehaviour));
		L.RegFunction("ExeCommand", ExeCommand);
		L.RegFunction("DoFile", DoFile);
		L.RegFunction("CallFunction", CallFunction);
		L.RegFunction("GetFunction", GetFunction);
		L.RegFunction("LuaGC", LuaGC);
		L.RegFunction("Close", Close);
		L.RegFunction("__eq", op_Equality);
		L.RegFunction("__tostring", ToLua.op_ToString);
		L.RegVar("instance", get_instance, set_instance);
		L.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int ExeCommand(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			ToLuaGameFramework.LuaManager obj = (ToLuaGameFramework.LuaManager)ToLua.CheckObject<ToLuaGameFramework.LuaManager>(L, 1);
			ToLuaGameFramework.CommandEnum arg0 = (ToLuaGameFramework.CommandEnum)ToLua.CheckObject(L, 2, typeof(ToLuaGameFramework.CommandEnum));
			bool o = obj.ExeCommand(arg0);
			LuaDLL.lua_pushboolean(L, o);
			return 1;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int DoFile(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			ToLuaGameFramework.LuaManager obj = (ToLuaGameFramework.LuaManager)ToLua.CheckObject<ToLuaGameFramework.LuaManager>(L, 1);
			string arg0 = ToLua.CheckString(L, 2);
			obj.DoFile(arg0);
			return 0;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int CallFunction(IntPtr L)
	{
		try
		{
			int count = LuaDLL.lua_gettop(L);

			if (count == 2)
			{
				ToLuaGameFramework.LuaManager obj = (ToLuaGameFramework.LuaManager)ToLua.CheckObject<ToLuaGameFramework.LuaManager>(L, 1);
				string arg0 = ToLua.CheckString(L, 2);
				obj.CallFunction(arg0);
				return 0;
			}
			else if (count == 3)
			{
				ToLuaGameFramework.LuaManager obj = (ToLuaGameFramework.LuaManager)ToLua.CheckObject<ToLuaGameFramework.LuaManager>(L, 1);
				string arg0 = ToLua.CheckString(L, 2);
				object arg1 = ToLua.ToVarObject(L, 3);
				obj.CallFunction(arg0, arg1);
				return 0;
			}
			else if (count == 4)
			{
				ToLuaGameFramework.LuaManager obj = (ToLuaGameFramework.LuaManager)ToLua.CheckObject<ToLuaGameFramework.LuaManager>(L, 1);
				string arg0 = ToLua.CheckString(L, 2);
				object arg1 = ToLua.ToVarObject(L, 3);
				object arg2 = ToLua.ToVarObject(L, 4);
				obj.CallFunction(arg0, arg1, arg2);
				return 0;
			}
			else if (count == 5)
			{
				ToLuaGameFramework.LuaManager obj = (ToLuaGameFramework.LuaManager)ToLua.CheckObject<ToLuaGameFramework.LuaManager>(L, 1);
				string arg0 = ToLua.CheckString(L, 2);
				object arg1 = ToLua.ToVarObject(L, 3);
				object arg2 = ToLua.ToVarObject(L, 4);
				object arg3 = ToLua.ToVarObject(L, 5);
				obj.CallFunction(arg0, arg1, arg2, arg3);
				return 0;
			}
			else if (count == 6)
			{
				ToLuaGameFramework.LuaManager obj = (ToLuaGameFramework.LuaManager)ToLua.CheckObject<ToLuaGameFramework.LuaManager>(L, 1);
				string arg0 = ToLua.CheckString(L, 2);
				object arg1 = ToLua.ToVarObject(L, 3);
				object arg2 = ToLua.ToVarObject(L, 4);
				object arg3 = ToLua.ToVarObject(L, 5);
				object arg4 = ToLua.ToVarObject(L, 6);
				obj.CallFunction(arg0, arg1, arg2, arg3, arg4);
				return 0;
			}
			else if (count == 7)
			{
				ToLuaGameFramework.LuaManager obj = (ToLuaGameFramework.LuaManager)ToLua.CheckObject<ToLuaGameFramework.LuaManager>(L, 1);
				string arg0 = ToLua.CheckString(L, 2);
				object arg1 = ToLua.ToVarObject(L, 3);
				object arg2 = ToLua.ToVarObject(L, 4);
				object arg3 = ToLua.ToVarObject(L, 5);
				object arg4 = ToLua.ToVarObject(L, 6);
				object arg5 = ToLua.ToVarObject(L, 7);
				obj.CallFunction(arg0, arg1, arg2, arg3, arg4, arg5);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L, "invalid arguments to method: ToLuaGameFramework.LuaManager.CallFunction");
			}
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int GetFunction(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			ToLuaGameFramework.LuaManager obj = (ToLuaGameFramework.LuaManager)ToLua.CheckObject<ToLuaGameFramework.LuaManager>(L, 1);
			string arg0 = ToLua.CheckString(L, 2);
			LuaInterface.LuaFunction o = obj.GetFunction(arg0);
			ToLua.Push(L, o);
			return 1;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int LuaGC(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 1);
			ToLuaGameFramework.LuaManager obj = (ToLuaGameFramework.LuaManager)ToLua.CheckObject<ToLuaGameFramework.LuaManager>(L, 1);
			obj.LuaGC();
			return 0;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int Close(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 1);
			ToLuaGameFramework.LuaManager obj = (ToLuaGameFramework.LuaManager)ToLua.CheckObject<ToLuaGameFramework.LuaManager>(L, 1);
			obj.Close();
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
	static int get_instance(IntPtr L)
	{
		try
		{
			ToLua.Push(L, ToLuaGameFramework.LuaManager.instance);
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
			ToLuaGameFramework.LuaManager arg0 = (ToLuaGameFramework.LuaManager)ToLua.CheckObject<ToLuaGameFramework.LuaManager>(L, 2);
			ToLuaGameFramework.LuaManager.instance = arg0;
			return 0;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}
}
