using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;

namespace ulriks_dotnet_core_hello_world_app.Controllers
{
    // https://localhost:5001/UlriksHelloApp

    [ApiController]
    [Route("[controller]")]
    public class UlriksHelloAppController : ControllerBase
    {
        private readonly ILogger<UlriksHelloAppController> _logger;

        public UlriksHelloAppController(ILogger<UlriksHelloAppController> logger)
        {
            _logger = logger;
        }

        [HttpGet]
        public IEnumerable<string> Get()
        {
            var rng = new Random();
            return new List<string> { "Ulrik", "says", "hello", "v2" };
        }
    }
}
