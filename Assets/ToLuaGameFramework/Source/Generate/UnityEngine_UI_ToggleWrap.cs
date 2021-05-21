﻿//this source code was auto-generated by tolua#, do not modify it
using System;
using ToLuaGameFramework;
using LuaInterface;

public class UnityEngine_UI_ToggleWrap
{
	public static void Register(LuaState L)
	{
		L.BeginClass(typeof(UnityEngine.UI.Toggle), typeof(UnityEngine.UI.Selectable));
		L.RegFunction("Rebuild", Rebuild);
		L.RegFunction("LayoutComplete", LayoutComplete);
		L.RegFunction("GraphicUpdateComplete", GraphicUpdateComplete);
		L.RegFunction("SetIsOnWithoutNotify", SetIsOnWithoutNotify);
		L.RegFunction("OnPointerClick", OnPointerClick);
		L.RegFunction("OnSubmit", OnSubmit);
		L.RegFunction("OnValueChanged", OnValueChanged);
		L.RegFunction("__eq", op_Equality);
		L.RegFunction("__tostring", ToLua.op_ToString);
		L.RegVar("toggleTransition", get_toggleTransition, set_toggleTransition);
		L.RegVar("graphic", get_graphic, set_graphic);
		L.RegVar("onValueChanged", get_onValueChanged, set_onValueChanged);
		L.RegVar("group", get_group, set_group);
		L.RegVar("isOn", get_isOn, set_isOn);
		L.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int Rebuild(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			UnityEngine.UI.Toggle obj = (UnityEngine.UI.Toggle)ToLua.CheckObject<UnityEngine.UI.Toggle>(L, 1);
			UnityEngine.UI.CanvasUpdate arg0 = (UnityEngine.UI.CanvasUpdate)ToLua.CheckObject(L, 2, typeof(UnityEngine.UI.CanvasUpdate));
			obj.Rebuild(arg0);
			return 0;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int LayoutComplete(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 1);
			UnityEngine.UI.Toggle obj = (UnityEngine.UI.Toggle)ToLua.CheckObject<UnityEngine.UI.Toggle>(L, 1);
			obj.LayoutComplete();
			return 0;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int GraphicUpdateComplete(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 1);
			UnityEngine.UI.Toggle obj = (UnityEngine.UI.Toggle)ToLua.CheckObject<UnityEngine.UI.Toggle>(L, 1);
			obj.GraphicUpdateComplete();
			return 0;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int SetIsOnWithoutNotify(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			UnityEngine.UI.Toggle obj = (UnityEngine.UI.Toggle)ToLua.CheckObject<UnityEngine.UI.Toggle>(L, 1);
			bool arg0 = LuaDLL.luaL_checkboolean(L, 2);
			obj.SetIsOnWithoutNotify(arg0);
			return 0;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int OnPointerClick(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			UnityEngine.UI.Toggle obj = (UnityEngine.UI.Toggle)ToLua.CheckObject<UnityEngine.UI.Toggle>(L, 1);
			UnityEngine.EventSystems.PointerEventData arg0 = (UnityEngine.EventSystems.PointerEventData)ToLua.CheckObject<UnityEngine.EventSystems.PointerEventData>(L, 2);
			obj.OnPointerClick(arg0);
			return 0;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int OnSubmit(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			UnityEngine.UI.Toggle obj = (UnityEngine.UI.Toggle)ToLua.CheckObject<UnityEngine.UI.Toggle>(L, 1);
			UnityEngine.EventSystems.BaseEventData arg0 = (UnityEngine.EventSystems.BaseEventData)ToLua.CheckObject<UnityEngine.EventSystems.BaseEventData>(L, 2);
			obj.OnSubmit(arg0);
			return 0;
		}
		catch (Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int OnValueChanged(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			UnityEngine.UI.Toggle obj = (UnityEngine.UI.Toggle)ToLua.CheckObject<UnityEngine.UI.Toggle>(L, 1);
			LuaFunction arg0 = ToLua.CheckLuaFunction(L, 2);
			obj.OnValueChanged(arg0);
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
	static int get_toggleTransition(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			UnityEngine.UI.Toggle obj = (UnityEngine.UI.Toggle)o;
			UnityEngine.UI.Toggle.ToggleTransition ret = obj.toggleTransition;
			ToLua.Push(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index toggleTransition on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_graphic(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			UnityEngine.UI.Toggle obj = (UnityEngine.UI.Toggle)o;
			UnityEngine.UI.Graphic ret = obj.graphic;
			ToLua.Push(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index graphic on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_onValueChanged(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			UnityEngine.UI.Toggle obj = (UnityEngine.UI.Toggle)o;
			UnityEngine.UI.Toggle.ToggleEvent ret = obj.onValueChanged;
			ToLua.PushObject(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index onValueChanged on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_group(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			UnityEngine.UI.Toggle obj = (UnityEngine.UI.Toggle)o;
			UnityEngine.UI.ToggleGroup ret = obj.group;
			ToLua.Push(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index group on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_isOn(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			UnityEngine.UI.Toggle obj = (UnityEngine.UI.Toggle)o;
			bool ret = obj.isOn;
			LuaDLL.lua_pushboolean(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index isOn on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_toggleTransition(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			UnityEngine.UI.Toggle obj = (UnityEngine.UI.Toggle)o;
			UnityEngine.UI.Toggle.ToggleTransition arg0 = (UnityEngine.UI.Toggle.ToggleTransition)ToLua.CheckObject(L, 2, typeof(UnityEngine.UI.Toggle.ToggleTransition));
			obj.toggleTransition = arg0;
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index toggleTransition on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_graphic(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			UnityEngine.UI.Toggle obj = (UnityEngine.UI.Toggle)o;
			UnityEngine.UI.Graphic arg0 = (UnityEngine.UI.Graphic)ToLua.CheckObject<UnityEngine.UI.Graphic>(L, 2);
			obj.graphic = arg0;
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index graphic on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_onValueChanged(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			UnityEngine.UI.Toggle obj = (UnityEngine.UI.Toggle)o;
			UnityEngine.UI.Toggle.ToggleEvent arg0 = (UnityEngine.UI.Toggle.ToggleEvent)ToLua.CheckObject<UnityEngine.UI.Toggle.ToggleEvent>(L, 2);
			obj.onValueChanged = arg0;
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index onValueChanged on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_group(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			UnityEngine.UI.Toggle obj = (UnityEngine.UI.Toggle)o;
			UnityEngine.UI.ToggleGroup arg0 = (UnityEngine.UI.ToggleGroup)ToLua.CheckObject<UnityEngine.UI.ToggleGroup>(L, 2);
			obj.group = arg0;
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index group on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_isOn(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			UnityEngine.UI.Toggle obj = (UnityEngine.UI.Toggle)o;
			bool arg0 = LuaDLL.luaL_checkboolean(L, 2);
			obj.isOn = arg0;
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o, "attempt to index isOn on a nil value");
		}
	}
}

