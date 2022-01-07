﻿//this source code was auto-generated by tolua#, do not modify it
using System;
using LuaInterface;

public class UnityEngine_UI_HorizontalOrVerticalLayoutGroupWrap
{
	public static void Register(LuaState L)
	{
		L.BeginClass(typeof(UnityEngine.UI.HorizontalOrVerticalLayoutGroup), typeof(UnityEngine.UI.LayoutGroup));
		L.RegFunction("__eq", op_Equality);
		L.RegFunction("__tostring", ToLua.op_ToString);
		L.RegVar("spacing", get_spacing, set_spacing);
		L.RegVar("childForceExpandWidth", get_childForceExpandWidth, set_childForceExpandWidth);
		L.RegVar("childForceExpandHeight", get_childForceExpandHeight, set_childForceExpandHeight);
		L.RegVar("childControlWidth", get_childControlWidth, set_childControlWidth);
		L.RegVar("childControlHeight", get_childControlHeight, set_childControlHeight);
		L.RegVar("childScaleWidth", get_childScaleWidth, set_childScaleWidth);
		L.RegVar("childScaleHeight", get_childScaleHeight, set_childScaleHeight);
		L.RegVar("reverseArrangement", get_reverseArrangement, set_reverseArrangement);
		L.EndClass();
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
	static int get_spacing(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			UnityEngine.UI.HorizontalOrVerticalLayoutGroup obj = (UnityEngine.UI.HorizontalOrVerticalLayoutGroup)o;
			float ret = obj.spacing;
			LuaDLL.lua_pushnumber(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index spacing on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_childForceExpandWidth(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			UnityEngine.UI.HorizontalOrVerticalLayoutGroup obj = (UnityEngine.UI.HorizontalOrVerticalLayoutGroup)o;
			bool ret = obj.childForceExpandWidth;
			LuaDLL.lua_pushboolean(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index childForceExpandWidth on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_childForceExpandHeight(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			UnityEngine.UI.HorizontalOrVerticalLayoutGroup obj = (UnityEngine.UI.HorizontalOrVerticalLayoutGroup)o;
			bool ret = obj.childForceExpandHeight;
			LuaDLL.lua_pushboolean(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index childForceExpandHeight on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_childControlWidth(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			UnityEngine.UI.HorizontalOrVerticalLayoutGroup obj = (UnityEngine.UI.HorizontalOrVerticalLayoutGroup)o;
			bool ret = obj.childControlWidth;
			LuaDLL.lua_pushboolean(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index childControlWidth on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_childControlHeight(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			UnityEngine.UI.HorizontalOrVerticalLayoutGroup obj = (UnityEngine.UI.HorizontalOrVerticalLayoutGroup)o;
			bool ret = obj.childControlHeight;
			LuaDLL.lua_pushboolean(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index childControlHeight on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_childScaleWidth(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			UnityEngine.UI.HorizontalOrVerticalLayoutGroup obj = (UnityEngine.UI.HorizontalOrVerticalLayoutGroup)o;
			bool ret = obj.childScaleWidth;
			LuaDLL.lua_pushboolean(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index childScaleWidth on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_childScaleHeight(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			UnityEngine.UI.HorizontalOrVerticalLayoutGroup obj = (UnityEngine.UI.HorizontalOrVerticalLayoutGroup)o;
			bool ret = obj.childScaleHeight;
			LuaDLL.lua_pushboolean(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index childScaleHeight on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_reverseArrangement(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			UnityEngine.UI.HorizontalOrVerticalLayoutGroup obj = (UnityEngine.UI.HorizontalOrVerticalLayoutGroup)o;
			bool ret = obj.reverseArrangement;
			LuaDLL.lua_pushboolean(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index reverseArrangement on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_spacing(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			UnityEngine.UI.HorizontalOrVerticalLayoutGroup obj = (UnityEngine.UI.HorizontalOrVerticalLayoutGroup)o;
			float arg0 = (float)LuaDLL.luaL_checknumber(L, 2);
			obj.spacing = arg0;
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index spacing on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_childForceExpandWidth(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			UnityEngine.UI.HorizontalOrVerticalLayoutGroup obj = (UnityEngine.UI.HorizontalOrVerticalLayoutGroup)o;
			bool arg0 = LuaDLL.luaL_checkboolean(L, 2);
			obj.childForceExpandWidth = arg0;
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index childForceExpandWidth on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_childForceExpandHeight(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			UnityEngine.UI.HorizontalOrVerticalLayoutGroup obj = (UnityEngine.UI.HorizontalOrVerticalLayoutGroup)o;
			bool arg0 = LuaDLL.luaL_checkboolean(L, 2);
			obj.childForceExpandHeight = arg0;
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index childForceExpandHeight on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_childControlWidth(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			UnityEngine.UI.HorizontalOrVerticalLayoutGroup obj = (UnityEngine.UI.HorizontalOrVerticalLayoutGroup)o;
			bool arg0 = LuaDLL.luaL_checkboolean(L, 2);
			obj.childControlWidth = arg0;
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index childControlWidth on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_childControlHeight(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			UnityEngine.UI.HorizontalOrVerticalLayoutGroup obj = (UnityEngine.UI.HorizontalOrVerticalLayoutGroup)o;
			bool arg0 = LuaDLL.luaL_checkboolean(L, 2);
			obj.childControlHeight = arg0;
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index childControlHeight on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_childScaleWidth(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			UnityEngine.UI.HorizontalOrVerticalLayoutGroup obj = (UnityEngine.UI.HorizontalOrVerticalLayoutGroup)o;
			bool arg0 = LuaDLL.luaL_checkboolean(L, 2);
			obj.childScaleWidth = arg0;
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index childScaleWidth on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_childScaleHeight(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			UnityEngine.UI.HorizontalOrVerticalLayoutGroup obj = (UnityEngine.UI.HorizontalOrVerticalLayoutGroup)o;
			bool arg0 = LuaDLL.luaL_checkboolean(L, 2);
			obj.childScaleHeight = arg0;
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index childScaleHeight on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_reverseArrangement(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			UnityEngine.UI.HorizontalOrVerticalLayoutGroup obj = (UnityEngine.UI.HorizontalOrVerticalLayoutGroup)o;
			bool arg0 = LuaDLL.luaL_checkboolean(L, 2);
			obj.reverseArrangement = arg0;
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index reverseArrangement on a nil value");
		}
	}
}

