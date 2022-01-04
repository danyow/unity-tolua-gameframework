/**
 * wuqibo
 * 2021.9.2
 * 导出Unity的API已便支持EmmyLua的代码提示
 * 枚举除了代码提示，还需要参与代码逻辑引用，所以独立导出文件方便require
 * 添加类方法：在CustomSettings.cs脚本中添加到customTypeList中即可
*/

using System;
using System.Collections.Generic;
using System.IO;
using System.Reflection;
using UnityEditor;
using UnityEngine;

namespace ToLuaGameFramework
{
    public class ExportUintyAPIForEmmyLua
    {
        static readonly string SavePath = Application.dataPath + "/ToLuaGameFramework/Lua/unity_api.lua";
        static readonly string SaveEnumPath = Application.dataPath + "/ToLuaGameFramework/Lua/unity_enum.lua";

        class Method
        {
            public Type returnType;
            public ParameterInfo[] parameters;
            public Method(Type returnType, ParameterInfo[] parameters)
            {
                this.returnType = returnType;
                this.parameters = parameters;
            }
        }
        static string content, enumContent;

        [MenuItem("Lua/Export Uinty API For EmmyLua")]
        private static void ExportUnityAPI()
        {
            ToLuaMenu.BindType[] typeList = CustomSettings.customTypeList;
            ToLuaMenu.BindType[] list = ToLuaMenu.GenBindTypes(typeList);
            content = "";
            enumContent = "";
            int total = list.Length;
            for (int i = 0; i < total; i++)
            {
                ExportClass(list[i].type, false, false);
                EditorUtility.DisplayProgressBar("正在为EmmyLua导出Unity API", i + "/" + total, i / (float)total);
            }
            SaveFile();
            EditorUtility.ClearProgressBar();
        }

        public static void Reset()
        {
            content = "";
            enumContent = "";
        }

        public static void SaveFile()
        {
            File.WriteAllText(SavePath, content);
            File.WriteAllText(SaveEnumPath, enumContent);
            Debug.Log("导出全部完成!");
        }

        /// <summary>
        /// includeAllBaseClas等于false时，会忽略所有父类的属性和方法，且自动添加注解为 ---@class XXXXX : BaseClass，父类则需要单独导出
        /// </summary>
        public static void ExportClass(Type clazz, bool includeAllBaseClas = true, bool autoSave = true)
        {
            //处理枚举（枚举导出后需要参与逻辑运算，所以导出独立的文件，务必添加require）
            if (clazz.BaseType == typeof(Enum))
            {
                FieldInfo[] fieldInfos = clazz.GetFields();
                enumContent += "\n---@class " + Replace(clazz.Name);
                enumContent += " @ ---------------------------------------------------------------";
                enumContent += "\n" + Replace(clazz.Name) + " = {";
                foreach (var fieldInfo in fieldInfos)
                {
                    enumContent += "\n    " + fieldInfo.Name + " = " + fieldInfo.DeclaringType.FullName.Replace("+", ".") + "." + fieldInfo.Name + ",";
                }
                enumContent += "\n}";
                if (autoSave)
                {
                    //保存文件
                    File.WriteAllText(SaveEnumPath, enumContent);
                    Debug.Log("导出 " + Replace(clazz.Name) + " 完成!");
                }
                return;
            }

            //处理非枚举的类
            Dictionary<string, Type> properties = new Dictionary<string, Type>();
            List<string> staticProperties = new List<string>();
            Dictionary<string, Method> publicMethods = new Dictionary<string, Method>();
            Dictionary<string, Method> staticMethods = new Dictionary<string, Method>();
            //属性
            PropertyInfo[] _properties = null;
            FieldInfo[] _fields = null;
            if (includeAllBaseClas)
            {
                _properties = clazz.GetProperties(BindingFlags.Public | BindingFlags.Instance);
                _fields = clazz.GetFields(BindingFlags.Public | BindingFlags.Instance);
            }
            else
            {
                _properties = clazz.GetProperties(BindingFlags.DeclaredOnly | BindingFlags.Public | BindingFlags.Instance);
                _fields = clazz.GetFields(BindingFlags.DeclaredOnly | BindingFlags.Public | BindingFlags.Instance);
            }
            for (int i = 0; i < _properties.Length; i++)
            {
                if (!properties.ContainsKey(_properties[i].Name)) properties.Add(_properties[i].Name, _properties[i].PropertyType);
            }
            for (int i = 0; i < _fields.Length; i++)
            {
                if (!properties.ContainsKey(_fields[i].Name)) properties.Add(_fields[i].Name, _fields[i].FieldType);
            }
            //静态变量
            PropertyInfo[] _staticProperties = clazz.GetProperties(BindingFlags.Public | BindingFlags.Static);
            FieldInfo[] _staticFields = clazz.GetFields(BindingFlags.Public | BindingFlags.Static);
            for (int i = 0; i < _staticProperties.Length; i++)
            {
                if (!staticProperties.Contains(_staticProperties[i].Name)) staticProperties.Add(_staticProperties[i].Name);
            }
            for (int i = 0; i < _staticFields.Length; i++)
            {
                if (!staticProperties.Contains(_staticFields[i].Name)) staticProperties.Add(_staticFields[i].Name);
            }

            //公共方法
            MethodInfo[] _publicMethods = null;
            if (includeAllBaseClas)
            {
                _publicMethods = clazz.GetMethods(BindingFlags.Public | BindingFlags.Instance);
            }
            else
            {
                _publicMethods = clazz.GetMethods(BindingFlags.DeclaredOnly | BindingFlags.Public | BindingFlags.Instance);
            }
            for (int i = 0; i < _publicMethods.Length; i++)
            {
                string methodName = _publicMethods[i].Name;
                char firstChar = methodName[0];
                if (firstChar >= 'A' && firstChar <= 'Z')
                {
                    //只取大写开头的方法
                    if (!publicMethods.ContainsKey(methodName)) publicMethods.Add(methodName, GetOneMethodWhenOverride(_publicMethods, methodName));
                }
            }

            //静态方法
            List<Type> allBaseClass = new List<Type>();
            Type parentType = clazz;
            for (int i = 0; i < 10; i++)
            {
                if (parentType != null)
                {
                    if (!allBaseClass.Contains(parentType))
                    {
                        allBaseClass.Add(parentType);
                    }
                    parentType = parentType.BaseType;
                }
            }
            for (int i = 0; i < allBaseClass.Count; i++)
            {
                Type _type = allBaseClass[i];
                MethodInfo[] _staticMethods = _type.GetMethods(BindingFlags.Public | BindingFlags.Static);
                for (int j = 0; j < _staticMethods.Length; j++)
                {
                    string methodName = _staticMethods[j].Name;
                    char firstChar = methodName[0];
                    if (firstChar >= 'A' && firstChar <= 'Z')
                    {
                        //只取大写开头的方法
                        if (!staticMethods.ContainsKey(methodName)) staticMethods.Add(methodName, GetOneMethodWhenOverride(_staticMethods, methodName));
                    }
                }
            }

            //写入内容
            content += "\n---@class " + Replace(clazz.Name);
            if (!includeAllBaseClas) content += " : " + clazz.BaseType.Name;
            content += " @ ---------------------------------------------------------------";
            content += "\nlocal " + Replace(clazz.Name) + " = {";
            foreach (var propertie in properties)
            {
                content += "\n    ---@type " + CTypeToLuaType(propertie.Value);
                content += "\n    " + propertie.Key + " = nil,";
            }
            content += "\n}";
            foreach (var item in staticProperties)
            {
                content += "\n" + Replace(clazz.Name) + "." + item + " = nil";
            }
            foreach (var item in publicMethods)
            {
                if (!"Void".Equals(item.Value.returnType.Name)) content += "\n---@return " + CTypeToLuaType(item.Value.returnType);
                for (int j = 0; j < item.Value.parameters.Length; j++)
                {
                    content += "\n---@param " + item.Value.parameters[j].Name + " " + CTypeToLuaType(item.Value.parameters[j].ParameterType);
                }
                content += "\nfunction " + Replace(clazz.Name) + ":" + item.Key + "(";
                for (int j = 0; j < item.Value.parameters.Length; j++)
                {
                    content += Arg(item.Value.parameters[j].Name);
                    if (j < item.Value.parameters.Length - 1) content += ", ";
                }
                content += ") end";
            }
            foreach (var item in staticMethods)
            {
                if (!"Void".Equals(item.Value.returnType.Name)) content += "\n---@return " + CTypeToLuaType(item.Value.returnType);
                for (int j = 0; j < item.Value.parameters.Length; j++)
                {
                    content += "\n---@param " + item.Value.parameters[j].Name + " " + CTypeToLuaType(item.Value.parameters[j].ParameterType);
                }
                content += "\nfunction " + Replace(clazz.Name) + "." + item.Key + "(";
                for (int j = 0; j < item.Value.parameters.Length; j++)
                {
                    content += Arg(item.Value.parameters[j].Name);
                    if (j < item.Value.parameters.Length - 1) content += ", ";
                }
                content += ") end";
            }
            content += "\n";

            //保存文件
            if (autoSave)
            {
                File.WriteAllText(SavePath, content);
                Debug.Log("导出 " + Replace(clazz.Name) + " 完成!");
            }
        }

        //有多个重写的方法只取一个参数最多的显示，否则多个同名方法重写EmmyLua反而无法弹出代码提示
        private static Method GetOneMethodWhenOverride(MethodInfo[] publicMethods, string methodName)
        {
            Method method = null;
            int count = -1;
            for (int i = 0; i < publicMethods.Length; i++)
            {
                MethodInfo methodInfo = publicMethods[i];
                if (methodInfo.Name.Equals(methodName))
                {
                    ParameterInfo[] parameters = methodInfo.GetParameters();
                    if (parameters.Length > count)
                    {
                        count = parameters.Length;
                        method = new Method(methodInfo.ReturnType, parameters);
                    }
                }
            }
            return method;
        }

        private static string CTypeToLuaType(Type type)
        {
            if (type == typeof(string) || type == typeof(String))
            {
                return "string";
            }
            if (type == typeof(int) || type == typeof(Int16) || type == typeof(Int32) || type == typeof(Int64))
            {
                return "number";
            }
            else if (type == typeof(bool) || type == typeof(Boolean))
            {
                return "boolean";
            }
            return Replace(type.Name);
        }

        private static string Replace(string content)
        {
            return content.Replace("`1", "").Replace("`2", "").Replace("`3", "").Replace("`4", "").Replace("`5", "").Replace("&", "");
        }

        private static string Arg(string arg)
        {
            if ("end".Equals(arg))
            {
                arg = "_end";
            }
            else if ("function".Equals(arg))
            {
                arg = "func";
            }
            return arg;
        }
    }
}