using Microsoft.AspNetCore.Mvc;

namespace MyFitnessCoach_Server.Controllers
{
	public class AccountController : Controller
	{
		public IActionResult Index()
		{
			return View();
		}
	}
}
