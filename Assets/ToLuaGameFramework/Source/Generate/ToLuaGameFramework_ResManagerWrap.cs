﻿//this source code was auto-generated by tolua#, do not modify it
using System;
using LuaInterface;

public class ToLuaGameFramework_ResManagerWrap
{
	public static void Register(LuaState L)
	{
		L.BeginClass(typeof(ToLuaGameFramework.ResManager), typeof(UnityEngine.MonoBehaviour));
		L.RegFunction("ExeCommand", ExeCommand);
		L.RegFunction("PreloadLocalAssetBundles", PreloadLocalAssetBundles);
		L.RegFunction("UnloadAllAssetBundles", UnloadAllAssetBundles);
		L.RegFunction("SpawnPrefab", SpawnPrefab);
		L.RegFunction("SpawnPrefabAsyn", SpawnPrefabAsyn);
		L.RegFunction("OnSpawnDestroy", OnSpawnDestroy);
		L.RegFunction("ClearMemory", ClearMemory);
		L.RegFunction("__eq", op_Equality);
		L.RegFunction("__tostring", ToLua.op_ToString);
		L.RegVar("instance", get_instance, set_instance);
		L.RegVar("localFiles", get_localFiles, set_localFiles);
		L.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int ExeCommand(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			ToLuaGameFramework.ResManager obj = (ToLuaGameFramework.ResManager)ToLua.CheckObject<ToLuaGameFramework.ResManager>(L, 1);
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
	static int PreloadLocalAssetBundles(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			string[] arg0 = ToLua.CheckStringArray(L, 1);
			LuaFunction arg1 = ToLua.CheckLuaFunction(L, 2);
			ToLuaGameFramework.ResManager.PreloadLocalAssetBundles(arg0, arg1);
			return 0;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int UnloadAllAssetBundles(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			ToLuaGameFramework.ResManager obj = (ToLuaGameFramework.ResManager)ToLua.CheckObject<ToLuaGameFramework.ResManager>(L, 1);
			bool arg0 = LuaDLL.luaL_checkboolean(L, 2);
			obj.UnloadAllAssetBundles(arg0);
			return 0;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int SpawnPrefab(IntPtr L)
	{
		try
		{
			int count = LuaDLL.lua_gettop(L);

			if (count == 2)
			{
				string arg0 = ToLua.CheckString(L, 1);
				UnityEngine.Transform arg1 = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L, 2);
				UnityEngine.GameObject o = ToLuaGameFramework.ResManager.SpawnPrefab(arg0, arg1);
				ToLua.PushSealed(L, o);
				return 1;
			}
			else if (count == 3)
			{
				string arg0 = ToLua.CheckString(L, 1);
				UnityEngine.Transform arg1 = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L, 2);
				bool arg2 = LuaDLL.luaL_checkboolean(L, 3);
				UnityEngine.GameObject o = ToLuaGameFramework.ResManager.SpawnPrefab(arg0, arg1, arg2);
				ToLua.PushSealed(L, o);
				return 1;
			}
			else if (count == 4)
			{
				string arg0 = ToLua.CheckString(L, 1);
				UnityEngine.Transform arg1 = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L, 2);
				bool arg2 = LuaDLL.luaL_checkboolean(L, 3);
				bool arg3 = LuaDLL.luaL_checkboolean(L, 4);
				UnityEngine.GameObject o = ToLuaGameFramework.ResManager.SpawnPrefab(arg0, arg1, arg2, arg3);
				ToLua.PushSealed(L, o);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L, "invalid arguments to method: ToLuaGameFramework.ResManager.SpawnPrefab");
			}
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int SpawnPrefabAsyn(IntPtr L)
	{
		try
		{
			int count = LuaDLL.lua_gettop(L);

			if (count == 3)
			{
				string arg0 = ToLua.CheckString(L, 1);
				UnityEngine.Transform arg1 = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L, 2);
				LuaFunction arg2 = ToLua.CheckLuaFunction(L, 3);
				ToLuaGameFramework.ResManager.SpawnPrefabAsyn(arg0, arg1, arg2);
				return 0;
			}
			else if (count == 4)
			{
				string arg0 = ToLua.CheckString(L, 1);
				UnityEngine.Transform arg1 = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L, 2);
				LuaFunction arg2 = ToLua.CheckLuaFunction(L, 3);
				bool arg3 = LuaDLL.luaL_checkboolean(L, 4);
				ToLuaGameFramework.ResManager.SpawnPrefabAsyn(arg0, arg1, arg2, arg3);
				return 0;
			}
			else if (count == 5)
			{
				string arg0 = ToLua.CheckString(L, 1);
				UnityEngine.Transform arg1 = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L, 2);
				LuaFunction arg2 = ToLua.CheckLuaFunction(L, 3);
				bool arg3 = LuaDLL.luaL_checkboolean(L, 4);
				bool arg4 = LuaDLL.luaL_checkboolean(L, 5);
				ToLuaGameFramework.ResManager.SpawnPrefabAsyn(arg0, arg1, arg2, arg3, arg4);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L, "invalid arguments to method: ToLuaGameFramework.ResManager.SpawnPrefabAsyn");
			}
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int OnSpawnDestroy(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 3);
			ToLuaGameFramework.ResManager obj = (ToLuaGameFramework.ResManager)ToLua.CheckObject<ToLuaGameFramework.ResManager>(L, 1);
			string arg0 = ToLua.CheckString(L, 2);
			bool arg1 = LuaDLL.luaL_checkboolean(L, 3);
			obj.OnSpawnDestroy(arg0, arg1);
			return 0;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int ClearMemory(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 1);
			ToLuaGameFramework.ResManager obj = (ToLuaGameFramework.ResManager)ToLua.CheckObject<ToLuaGameFramework.ResManager>(L, 1);
			obj.ClearMemory();
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
			ToLua.Push(L, ToLuaGameFramework.ResManager.instance);
			return 1;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_localFiles(IntPtr L)
	{
		try
		{
			ToLua.PushSealed(L, ToLuaGameFramework.ResManager.localFiles);
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
			ToLuaGameFramework.ResManager arg0 = (ToLuaGameFramework.ResManager)ToLua.CheckObject<ToLuaGameFramework.ResManager>(L, 2);
			ToLuaGameFramework.ResManager.instance = arg0;
			return 0;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_localFiles(IntPtr L)
	{
		try
		{
			System.Collections.Generic.Dictionary<string,string> arg0 = (System.Collections.Generic.Dictionary<string,string>)ToLua.CheckObject(L, 2, typeof(System.Collections.Generic.Dictionary<string,string>));
			ToLuaGameFramework.ResManager.localFiles = arg0;
			return 0;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}
}
