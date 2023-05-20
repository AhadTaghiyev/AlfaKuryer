using System;
using Microsoft.AspNetCore.Http;

namespace AlfaKuryer.Application.Dtos.SlideDtos
{
	public record SlidePostDto
	{
	  public IFormFile? formFIle { get; set; }
	}
}

