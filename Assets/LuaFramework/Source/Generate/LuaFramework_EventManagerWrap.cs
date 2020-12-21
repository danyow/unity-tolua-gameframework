﻿//this source code was auto-generated by tolua#, do not modify it
using System;
using LuaInterface;

public class LuaFramework_EventManagerWrap
{
	public static void Register(LuaState L)
	{
		L.BeginClass(typeof(LuaFramework.EventManager), typeof(System.Object));
		L.RegFunction("Add", Add);
		L.RegFunction("Remove", Remove);
		L.RegFunction("Clear", Clear);
		L.RegFunction("ClearAll", ClearAll);
		L.RegFunction("Emit", Emit);
		L.RegFunction("New", _CreateLuaFramework_EventManager);
		L.RegFunction("__tostring", ToLua.op_ToString);
		L.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int _CreateLuaFramework_EventManager(IntPtr L)
	{
		try
		{
			int count = LuaDLL.lua_gettop(L);

			if (count == 0)
			{
				LuaFramework.EventManager obj = new LuaFramework.EventManager();
				ToLua.PushObject(L, obj);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L, "invalid arguments to ctor method: LuaFramework.EventManager.New");
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
			LuaFramework.EventEnum arg0 = (LuaFramework.EventEnum)ToLua.CheckObject(L, 1, typeof(LuaFramework.EventEnum));
			System.Action<LuaFramework.BaseEventData> arg1 = (System.Action<LuaFramework.BaseEventData>)ToLua.CheckDelegate<System.Action<LuaFramework.BaseEventData>>(L, 2);
			LuaFramework.EventManager.Add(arg0, arg1);
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
			ToLua.CheckArgsCount(L, 2);
			LuaFramework.EventEnum arg0 = (LuaFramework.EventEnum)ToLua.CheckObject(L, 1, typeof(LuaFramework.EventEnum));
			System.Action<LuaFramework.BaseEventData> arg1 = (System.Action<LuaFramework.BaseEventData>)ToLua.CheckDelegate<System.Action<LuaFramework.BaseEventData>>(L, 2);
			LuaFramework.EventManager.Remove(arg0, arg1);
			return 0;
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
			ToLua.CheckArgsCount(L, 1);
			LuaFramework.EventEnum arg0 = (LuaFramework.EventEnum)ToLua.CheckObject(L, 1, typeof(LuaFramework.EventEnum));
			LuaFramework.EventManager.Clear(arg0);
			return 0;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int ClearAll(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 0);
			LuaFramework.EventManager.ClearAll();
			return 0;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int Emit(IntPtr L)
	{
		try
		{
			int count = LuaDLL.lua_gettop(L);

			if (count == 2 && TypeChecker.CheckTypes<LuaFramework.BaseEventData>(L, 2))
			{
				LuaFramework.EventEnum arg0 = (LuaFramework.EventEnum)ToLua.CheckObject(L, 1, typeof(LuaFramework.EventEnum));
				LuaFramework.BaseEventData arg1 = (LuaFramework.BaseEventData)ToLua.ToObject(L, 2);
				LuaFramework.EventManager.Emit(arg0, arg1);
				return 0;
			}
			else if (TypeChecker.CheckTypes<LuaFramework.EventEnum>(L, 1) && TypeChecker.CheckParamsType<object>(L, 2, count - 1))
			{
				LuaFramework.EventEnum arg0 = (LuaFramework.EventEnum)ToLua.CheckObject(L, 1, typeof(LuaFramework.EventEnum));
				object[] arg1 = ToLua.ToParamsObject(L, 2, count - 1);
				LuaFramework.EventManager.Emit(arg0, arg1);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L, "invalid arguments to method: LuaFramework.EventManager.Emit");
			}
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}
}

