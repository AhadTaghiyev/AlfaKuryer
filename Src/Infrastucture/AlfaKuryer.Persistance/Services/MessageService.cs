using System;
using AlfaKuryer.Application.Dtos.MessageDto;
using AlfaKuryer.Application.Repositories.ReadRepositories;
using AlfaKuryer.Application.Repositories.WriteRepositories;
using AlfaKuryer.Application.Services.MessageService;
using AlfaKuryer.Domain.Entities;
using AlfaKuryer.Persistance.CustomExceptions;
using AutoMapper;

namespace AlfaKuryer.Persistance.Services
{
    public class MessageService : IMessageService
    {
        private readonly IMessageReadRepository _MessageReadRepository;
        private readonly IMessageWriteRepository _MessageWriteRepository;
        private readonly IMapper _mapper;

        public MessageService(IMessageReadRepository MessageReadRepository, IMessageWriteRepository MessageWriteRepository, IMapper mapper)
        {
            _MessageReadRepository = MessageReadRepository;
            _MessageWriteRepository = MessageWriteRepository;
            _mapper = mapper;
        }

        public async Task Create(MessagePostDto postDto)
        {
            Message Message = _mapper.Map<Message>(postDto);
            await _MessageWriteRepository.AddAsync(Message);
            await _MessageWriteRepository.SaveAsync();
        }

     

        public async Task<IEnumerable<MessageGetDto>> GetAll()
        {
            var query = await _MessageReadRepository.GetAllAsync(x => !x.IsDeleted, false, false);

            IEnumerable<MessageGetDto> getDtos = new HashSet<MessageGetDto>();

            getDtos = query.Select(x => new MessageGetDto { Id=x.Id,Content=x.Content,Email=x.Email,FullName=x.FullName,PhoneNumber=x.PhoneNumber,Subject=x.Subject}).ToHashSet<MessageGetDto>();
            return getDtos;
        }

        public async Task Remove(int id)
        {
            Message Message = await _MessageReadRepository.GetAsync(x => !x.IsDeleted && x.Id == id, true, false);
            if (Message == null)
                throw new ItemNotFound("Message Not Found");

            Message.IsDeleted = true;
            await _MessageWriteRepository.UpdateAsync(Message);
            await _MessageWriteRepository.SaveAsync();
        }

   
    }

}