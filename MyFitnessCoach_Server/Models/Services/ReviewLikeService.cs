using System.Text.Json;
using System.Collections.Concurrent;

namespace MyFitnessCoach_Server.Models.Services
{
    public class ReviewLikeService
    {
        private readonly string _filePath;
        private static readonly ConcurrentDictionary<int, HashSet<int>> _likes = new ConcurrentDictionary<int, HashSet<int>>();
        private static readonly object _saveLock = new object();
        private static bool _isLoaded = false;

        public ReviewLikeService(IWebHostEnvironment env)
        {
            _filePath = Path.Combine(env.ContentRootPath, "StaticFiles", "review_likes_stable.json");
            EnsureLoaded();
        }

        private void EnsureLoaded()
        {
            if (_isLoaded) return;
            lock (_saveLock)
            {
                if (_isLoaded) return;
                try
                {
                    if (File.Exists(_filePath))
                    {
                        var json = File.ReadAllText(_filePath);
                        var data = JsonSerializer.Deserialize<Dictionary<int, List<int>>>(json);
                        if (data != null)
                        {
                            foreach (var k in data)
                            {
                                _likes[k.Key] = new HashSet<int>(k.Value);
                            }
                        }
                    }
                }
                catch { }
                _isLoaded = true;
            }
        }

        private void Save()
        {
            lock (_saveLock)
            {
                try
                {
                    var dir = Path.GetDirectoryName(_filePath);
                    if (dir != null && !Directory.Exists(dir)) Directory.CreateDirectory(dir);
                    var data = _likes.ToDictionary(k => k.Key, v => v.Value.ToList());
                    File.WriteAllText(_filePath, JsonSerializer.Serialize(data));
                }
                catch { }
            }
        }

        public int GetLikeCount(int id)
        {
            return _likes.TryGetValue(id, out var m) ? m.Count : 0;
        }

        public bool IsLiked(int id, int mid)
        {
            return _likes.TryGetValue(id, out var m) && m.Contains(mid);
        }

        public (int count, bool isLiked) ToggleLike(int id, int mid)
        {
            var m = _likes.GetOrAdd(id, _ => new HashSet<int>());
            bool liked;
            lock (m)
            {
                if (m.Contains(mid))
                {
                    m.Remove(mid);
                    liked = false;
                }
                else
                {
                    m.Add(mid);
                    liked = true;
                }
            }
            Save();
            return (m.Count, liked);
        }
    }
}
