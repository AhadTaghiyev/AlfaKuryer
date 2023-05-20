using System;
namespace AlfaKuryer.Application.Dtos
{
	public class ListDto<T>
	{
		public IEnumerable<T> Items;
		public ListDto()
		{
			Items = new HashSet<T>();
		}
	}
}

