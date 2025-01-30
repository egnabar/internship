using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Threading.Tasks;
using System.Web.Http;
using Newtonsoft.Json;

namespace deul
{
    public class TestController : ApiController
    {
        private static readonly string apiToken = "SgdzXvmOpxlikPa3clwtvtFvibbHFSsbFK7S7xzB5evrOVegLA8nGtA_u3DpHDv9uBA";
        private static readonly string userEmail = "onetasticunity@gmail.com"; // Replace with your actual email

        private static readonly HttpClient client = new HttpClient();

        public TestController()
        {
            client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
        }

        private async Task<string> GetAuthorizationTokenAsync()
        {
            client.DefaultRequestHeaders.Clear();
            client.DefaultRequestHeaders.Add("api-token", apiToken);
            client.DefaultRequestHeaders.Add("user-email", userEmail);

            HttpResponseMessage response = await client.GetAsync("https://www.universal-tutorial.com/api/getaccesstoken");
            response.EnsureSuccessStatusCode();

            string content = await response.Content.ReadAsStringAsync();
            var tokenResponse = JsonConvert.DeserializeObject<Dictionary<string, string>>(content);
            return tokenResponse["auth_token"];
        }

        // GET api/test/countries
        [HttpGet]
        [Route("https://www.universal-tutorial.com/api/countries/")]
        public async Task<IEnumerable<string>> GetCountriesAsync()
        {
            string token = await GetAuthorizationTokenAsync();
            client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);

            HttpResponseMessage response = await client.GetAsync("https://www.universal-tutorial.com/api/countries/");
            response.EnsureSuccessStatusCode();

            string content = await response.Content.ReadAsStringAsync();
            var countries = JsonConvert.DeserializeObject<List<Country>>(content);
            return countries.ConvertAll(c => c.country_name);
        }

        // GET api/test/states/{countryName}
        [HttpGet]
        [Route("api/test/states/{countryName}")]
        public async Task<IEnumerable<string>> GetStatesAsync(string countryName)
        {
            string token = await GetAuthorizationTokenAsync();
            client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);

            HttpResponseMessage response = await client.GetAsync($"https://www.universal-tutorial.com/api/states/{countryName}");
            response.EnsureSuccessStatusCode();

            string content = await response.Content.ReadAsStringAsync();
            var states = JsonConvert.DeserializeObject<List<State>>(content);
            return states.ConvertAll(s => s.state_name);
        }

        // GET api/test/cities/{stateName}
        [HttpGet]
        [Route("api/test/cities/{stateName}")]
        public async Task<IEnumerable<string>> GetCitiesAsync(string stateName)
        {
            string token = await GetAuthorizationTokenAsync();
            client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);

            HttpResponseMessage response = await client.GetAsync($"https://www.universal-tutorial.com/api/cities/{stateName}");
            response.EnsureSuccessStatusCode();

            string content = await response.Content.ReadAsStringAsync();
            var cities = JsonConvert.DeserializeObject<List<City>>(content);
            return cities.ConvertAll(c => c.city_name);
        }

        // Models for API response
        public class Country
        {
            public string country_name { get; set; }
            public string country_short_name { get; set; }
            public int country_phone_code { get; set; }
        }

        public class State
        {
            public string state_name { get; set; }
        }

        public class City
        {
            public string city_name { get; set; }
        }
    }
}
