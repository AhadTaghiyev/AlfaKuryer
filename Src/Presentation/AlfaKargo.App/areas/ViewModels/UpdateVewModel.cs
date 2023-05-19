using System;
using AlfaKuryer.Domain.Entities.Base;

namespace AlfaKargo.App.areas.ViewModels
{
	public record UpdateVewModel<T,U> where T:new() where U:new()
	{
		public T PostDto { get; set; }
		public U GetDto { get; set; }
       
	}
}

