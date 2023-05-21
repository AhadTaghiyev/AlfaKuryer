using System;
using AlfaKuryer.Domain.Entities.Base;

namespace AlfaKuryer.Domain.Entities
{
	public class News:BaseEntity
	{
		public string Image { get; set; }
		public List<NewsLanguage> NewsLanguages { get; set; }
	}
}

