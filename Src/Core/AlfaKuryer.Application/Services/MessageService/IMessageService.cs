using System;
using AlfaKuryer.Application.Dtos.MessageDto;

namespace AlfaKuryer.Application.Services.MessageService
{
	public interface IMessageService
	{
		public Task Create(MessagePostDto postDto);
		public Task<IEnumerable<MessageGetDto>> GetAll();
		public Task Remove(int id);
	}
}

