using System;
namespace AlfaKuryer.Domain.Entities.Base
{
	public class HelpLanguage
	{
		public int Id { get; set; }
		public string Title { get; set; }
		public string Description { get; set; }
		public string Code { get; set; }
		public int HelpId { get; set; }
		public Help Help { get; set; }
	}
}

