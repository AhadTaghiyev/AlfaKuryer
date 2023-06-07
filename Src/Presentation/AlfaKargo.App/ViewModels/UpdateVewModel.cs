using System;
using AlfaKuryer.Domain.Entities.Base;

namespace AlfaKargo.App.ViewModels
{
	public record UpdateVewModel<T,U> 
	{
		public T? PostDto { get; set; }
		public U? GetDto { get; set; }
       
	}
}

