﻿//this source code was auto-generated by tolua#, do not modify it
using System;
using LuaInterface;

public class LuaFramework_ResManagerWrap
{
	public static void Register(LuaState L)
	{
		L.BeginClass(typeof(LuaFramework.ResManager), typeof(UnityEngine.MonoBehaviour));
		L.RegFunction("ExeCommand", ExeCommand);
		L.RegFunction("PreloadLocalAssetBundles", PreloadLocalAssetBundles);
		L.RegFunction("UnloadAllAssetBundles", UnloadAllAssetBundles);
		L.RegFunction("SpawnPrefab", SpawnPrefab);
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
			LuaFramework.ResManager obj = (LuaFramework.ResManager)ToLua.CheckObject<LuaFramework.ResManager>(L, 1);
			LuaFramework.CommandEnum arg0 = (LuaFramework.CommandEnum)ToLua.CheckObject(L, 2, typeof(LuaFramework.CommandEnum));
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
			ToLua.CheckArgsCount(L, 3);
			LuaFramework.ResManager obj = (LuaFramework.ResManager)ToLua.CheckObject<LuaFramework.ResManager>(L, 1);
			string[] arg0 = ToLua.CheckStringArray(L, 2);
			System.Action<float> arg1 = (System.Action<float>)ToLua.CheckDelegate<System.Action<float>>(L, 3);
			obj.PreloadLocalAssetBundles(arg0, arg1);
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
			LuaFramework.ResManager obj = (LuaFramework.ResManager)ToLua.CheckObject<LuaFramework.ResManager>(L, 1);
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

			if (count == 4)
			{
				LuaFramework.ResManager obj = (LuaFramework.ResManager)ToLua.CheckObject<LuaFramework.ResManager>(L, 1);
				string arg0 = ToLua.CheckString(L, 2);
				UnityEngine.Transform arg1 = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L, 3);
				System.Action<UnityEngine.GameObject> arg2 = (System.Action<UnityEngine.GameObject>)ToLua.CheckDelegate<System.Action<UnityEngine.GameObject>>(L, 4);
				obj.SpawnPrefab(arg0, arg1, arg2);
				return 0;
			}
			else if (count == 5)
			{
				LuaFramework.ResManager obj = (LuaFramework.ResManager)ToLua.CheckObject<LuaFramework.ResManager>(L, 1);
				string arg0 = ToLua.CheckString(L, 2);
				UnityEngine.Transform arg1 = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L, 3);
				System.Action<UnityEngine.GameObject> arg2 = (System.Action<UnityEngine.GameObject>)ToLua.CheckDelegate<System.Action<UnityEngine.GameObject>>(L, 4);
				bool arg3 = LuaDLL.luaL_checkboolean(L, 5);
				obj.SpawnPrefab(arg0, arg1, arg2, arg3);
				return 0;
			}
			else if (count == 6)
			{
				LuaFramework.ResManager obj = (LuaFramework.ResManager)ToLua.CheckObject<LuaFramework.ResManager>(L, 1);
				string arg0 = ToLua.CheckString(L, 2);
				UnityEngine.Transform arg1 = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L, 3);
				System.Action<UnityEngine.GameObject> arg2 = (System.Action<UnityEngine.GameObject>)ToLua.CheckDelegate<System.Action<UnityEngine.GameObject>>(L, 4);
				bool arg3 = LuaDLL.luaL_checkboolean(L, 5);
				bool arg4 = LuaDLL.luaL_checkboolean(L, 6);
				obj.SpawnPrefab(arg0, arg1, arg2, arg3, arg4);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L, "invalid arguments to method: LuaFramework.ResManager.SpawnPrefab");
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
			LuaFramework.ResManager obj = (LuaFramework.ResManager)ToLua.CheckObject<LuaFramework.ResManager>(L, 1);
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
			LuaFramework.ResManager obj = (LuaFramework.ResManager)ToLua.CheckObject<LuaFramework.ResManager>(L, 1);
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
			ToLua.Push(L, LuaFramework.ResManager.instance);
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
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			LuaFramework.ResManager obj = (LuaFramework.ResManager)o;
			System.Collections.Generic.Dictionary<string,string> ret = obj.localFiles;
			ToLua.PushSealed(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index localFiles on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_instance(IntPtr L)
	{
		try
		{
			LuaFramework.ResManager arg0 = (LuaFramework.ResManager)ToLua.CheckObject<LuaFramework.ResManager>(L, 2);
			LuaFramework.ResManager.instance = arg0;
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
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			LuaFramework.ResManager obj = (LuaFramework.ResManager)o;
			System.Collections.Generic.Dictionary<string,string> arg0 = (System.Collections.Generic.Dictionary<string,string>)ToLua.CheckObject(L, 2, typeof(System.Collections.Generic.Dictionary<string,string>));
			obj.localFiles = arg0;
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index localFiles on a nil value");
		}
	}
}

