

using AlfaKuryer.Domain.Entities.Base;

namespace AlfaKuryer.Domain.Entities
{
    public class Setting:BaseEntity
    {

        public string Logo { get; set; }
        public string PhoneNumber1 { get; set; }
        public string PhoneNumber2 { get; set; }
        public string Email { get; set; }
        public string InstgaramLink { get; set; }
        public string FaceBookLink { get; set; }
        public string YoutubeLink { get; set; }
        public string Adress { get; set; }
    }
}
