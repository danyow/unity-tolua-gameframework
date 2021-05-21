using UnityEngine;
using System.Collections.Generic;

namespace ToLuaGameFramework
{
    public class SoundManager : MonoBehaviour
    {
        public static SoundManager instance;

        static Dictionary<string, AudioClip> loadedClips = new Dictionary<string, AudioClip>();

        void Awake()
        {
            instance = this;
        }

        /// <summary>
        /// 播放短音效
        /// </summary>
        /// <param name="clipPath">LuaDev目录下的声音路径</param>
        /// <param name="loopTimes">循环次数：0表示不循环,-1表示无线循环，大于零表示循环次数</param>
        /// <param name="loopID">传入循环ID后，可用StopSound()方法随时停止</param>
        public static void PlaySound(string clipPath, float volume = 1, int loopTimes = 0, string loopID = null)
        {
            AudioClip clip = null;
            if (loadedClips.ContainsKey(clipPath))
            {
                clip = loadedClips[clipPath];
            }
            else
            {
                clip = ResManager.LoadAssetSyn<AudioClip>(clipPath);
                loadedClips.Add(clipPath, clip);
            }
            //魔力海洋暂用原有自带播放接口，以后纯lua用AudioSource
            AudioSource audioSource = instance.GetComponent<AudioSource>();
            if (!audioSource) audioSource = instance.gameObject.AddComponent<AudioSource>();
            if (loopTimes == 0)
            {
                audioSource.PlayOneShot(clip, volume);
            }
            else
            {
                if (loopTimes < 0 || loopTimes > 0)
                {
                    LTimer.Invoke(() =>
                    {
                        audioSource.PlayOneShot(clip, volume);
                    }, 0, clip.length, loopTimes, loopID);
                }
            }
        }

        /// <summary>
        /// 配合 PlaySound() 传入的loopID停止音效播放
        /// </summary>
        public static void StopSound(string loopID)
        {
            LTimer.InvokeCancel(loopID);
        }
    }
}