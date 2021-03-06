//this source code was auto-generated by tolua#, do not modify it
using System;
using LuaInterface;

public class ToLuaGameFramework_LAESWrap
{
	public static void Register(LuaState L)
	{
		L.BeginClass(typeof(ToLuaGameFramework.LAES), typeof(System.Object));
		L.RegFunction("Encrypt", Encrypt);
		L.RegFunction("Decrypt", Decrypt);
		L.RegFunction("New", _CreateToLuaGameFramework_LAES);
		L.RegFunction("__tostring", ToLua.op_ToString);
		L.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int _CreateToLuaGameFramework_LAES(IntPtr L)
	{
		try
		{
			int count = LuaDLL.lua_gettop(L);

			if (count == 0)
			{
				ToLuaGameFramework.LAES obj = new ToLuaGameFramework.LAES();
				ToLua.PushObject(L, obj);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L, "invalid arguments to ctor method: ToLuaGameFramework.LAES.New");
			}
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int Encrypt(IntPtr L)
	{
		try
		{
			int count = LuaDLL.lua_gettop(L);

			if (count == 1)
			{
				string arg0 = ToLua.CheckString(L, 1);
				string o = ToLuaGameFramework.LAES.Encrypt(arg0);
				LuaDLL.lua_pushstring(L, o);
				return 1;
			}
			else if (count == 2)
			{
				string arg0 = ToLua.CheckString(L, 1);
				string arg1 = ToLua.CheckString(L, 2);
				string o = ToLuaGameFramework.LAES.Encrypt(arg0, arg1);
				LuaDLL.lua_pushstring(L, o);
				return 1;
			}
			else if (count == 3)
			{
				string arg0 = ToLua.CheckString(L, 1);
				string arg1 = ToLua.CheckString(L, 2);
				string arg2 = ToLua.CheckString(L, 3);
				string o = ToLuaGameFramework.LAES.Encrypt(arg0, arg1, arg2);
				LuaDLL.lua_pushstring(L, o);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L, "invalid arguments to method: ToLuaGameFramework.LAES.Encrypt");
			}
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int Decrypt(IntPtr L)
	{
		try
		{
			int count = LuaDLL.lua_gettop(L);

			if (count == 1)
			{
				string arg0 = ToLua.CheckString(L, 1);
				string o = ToLuaGameFramework.LAES.Decrypt(arg0);
				LuaDLL.lua_pushstring(L, o);
				return 1;
			}
			else if (count == 2)
			{
				string arg0 = ToLua.CheckString(L, 1);
				string arg1 = ToLua.CheckString(L, 2);
				string o = ToLuaGameFramework.LAES.Decrypt(arg0, arg1);
				LuaDLL.lua_pushstring(L, o);
				return 1;
			}
			else if (count == 3)
			{
				string arg0 = ToLua.CheckString(L, 1);
				string arg1 = ToLua.CheckString(L, 2);
				string arg2 = ToLua.CheckString(L, 3);
				string o = ToLuaGameFramework.LAES.Decrypt(arg0, arg1, arg2);
				LuaDLL.lua_pushstring(L, o);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L, "invalid arguments to method: ToLuaGameFramework.LAES.Decrypt");
			}
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}
}

