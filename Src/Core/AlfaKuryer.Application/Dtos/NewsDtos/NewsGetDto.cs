using System;
namespace AlfaKuryer.Application.Dtos.NewsDtos
{
	public class NewsGetDto
	{
		public int Id { get; set; }
		public string Image { get; set; }
		public string Title { get; set; }
		public string Description { get; set; }
        public DateTime CreatedAt { get; set; }
    }
}

