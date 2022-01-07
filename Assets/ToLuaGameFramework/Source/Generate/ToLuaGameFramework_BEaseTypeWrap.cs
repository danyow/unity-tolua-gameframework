﻿//this source code was auto-generated by tolua#, do not modify it
using System;
using LuaInterface;

public class ToLuaGameFramework_BEaseTypeWrap
{
	public static void Register(LuaState L)
	{
		L.BeginEnum(typeof(ToLuaGameFramework.BEaseType));
		L.RegVar("Linear", get_Linear, null);
		L.RegVar("ExpoIn", get_ExpoIn, null);
		L.RegVar("ExpoOut", get_ExpoOut, null);
		L.RegVar("ExpoInOut", get_ExpoInOut, null);
		L.RegVar("SineIn", get_SineIn, null);
		L.RegVar("SineOut", get_SineOut, null);
		L.RegVar("SineInOut", get_SineInOut, null);
		L.RegVar("ElasticIn", get_ElasticIn, null);
		L.RegVar("ElasticOut", get_ElasticOut, null);
		L.RegVar("ElasticInOut", get_ElasticInOut, null);
		L.RegVar("BackIn", get_BackIn, null);
		L.RegVar("BackOut", get_BackOut, null);
		L.RegVar("BackInOut", get_BackInOut, null);
		L.RegVar("BounceIn", get_BounceIn, null);
		L.RegVar("BounceOut", get_BounceOut, null);
		L.RegVar("BounceInOut", get_BounceInOut, null);
		L.RegFunction("IntToEnum", IntToEnum);
		L.EndEnum();
		TypeTraits<ToLuaGameFramework.BEaseType>.Check = CheckType;
		StackTraits<ToLuaGameFramework.BEaseType>.Push = Push;
	}

	static void Push(IntPtr L, ToLuaGameFramework.BEaseType arg)
	{
		ToLua.Push(L, arg);
	}

	static bool CheckType(IntPtr L, int pos)
	{
		return TypeChecker.CheckEnumType(typeof(ToLuaGameFramework.BEaseType), L, pos);
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_Linear(IntPtr L)
	{
		ToLua.Push(L, ToLuaGameFramework.BEaseType.Linear);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_ExpoIn(IntPtr L)
	{
		ToLua.Push(L, ToLuaGameFramework.BEaseType.ExpoIn);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_ExpoOut(IntPtr L)
	{
		ToLua.Push(L, ToLuaGameFramework.BEaseType.ExpoOut);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_ExpoInOut(IntPtr L)
	{
		ToLua.Push(L, ToLuaGameFramework.BEaseType.ExpoInOut);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_SineIn(IntPtr L)
	{
		ToLua.Push(L, ToLuaGameFramework.BEaseType.SineIn);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_SineOut(IntPtr L)
	{
		ToLua.Push(L, ToLuaGameFramework.BEaseType.SineOut);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_SineInOut(IntPtr L)
	{
		ToLua.Push(L, ToLuaGameFramework.BEaseType.SineInOut);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_ElasticIn(IntPtr L)
	{
		ToLua.Push(L, ToLuaGameFramework.BEaseType.ElasticIn);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_ElasticOut(IntPtr L)
	{
		ToLua.Push(L, ToLuaGameFramework.BEaseType.ElasticOut);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_ElasticInOut(IntPtr L)
	{
		ToLua.Push(L, ToLuaGameFramework.BEaseType.ElasticInOut);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_BackIn(IntPtr L)
	{
		ToLua.Push(L, ToLuaGameFramework.BEaseType.BackIn);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_BackOut(IntPtr L)
	{
		ToLua.Push(L, ToLuaGameFramework.BEaseType.BackOut);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_BackInOut(IntPtr L)
	{
		ToLua.Push(L, ToLuaGameFramework.BEaseType.BackInOut);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_BounceIn(IntPtr L)
	{
		ToLua.Push(L, ToLuaGameFramework.BEaseType.BounceIn);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_BounceOut(IntPtr L)
	{
		ToLua.Push(L, ToLuaGameFramework.BEaseType.BounceOut);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_BounceInOut(IntPtr L)
	{
		ToLua.Push(L, ToLuaGameFramework.BEaseType.BounceInOut);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int IntToEnum(IntPtr L)
	{
		int arg0 = (int)LuaDLL.lua_tonumber(L, 1);
		ToLuaGameFramework.BEaseType o = (ToLuaGameFramework.BEaseType)arg0;
		ToLua.Push(L, o);
		return 1;
	}
}

