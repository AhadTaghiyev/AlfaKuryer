using System;
namespace AlfaKuryer.Domain.Entities
{
	public class NewsLanguage
	{
        public int Id { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public string Code { get; set; }
        public int NewsId { get; set; }
        public News News { get; set; }
    }
}

