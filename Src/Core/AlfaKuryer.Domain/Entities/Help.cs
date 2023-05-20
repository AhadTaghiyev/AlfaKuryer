using System;
using AlfaKuryer.Domain.Entities.Base;

namespace AlfaKuryer.Domain.Entities
{
	public class Help:BaseEntity
	{
      public List<HelpLanguage>? HelpLanguages { get; set; }
    }
}

