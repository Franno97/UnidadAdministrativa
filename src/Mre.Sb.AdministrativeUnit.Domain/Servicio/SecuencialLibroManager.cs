using Microsoft.Extensions.Localization;
using Mre.Sb.UnidadAdministrativa.Dominio;
using Mre.Sb.AdministrativeUnit.Localization;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Volo.Abp;
using Volo.Abp.Domain.Repositories;
using Volo.Abp.Domain.Services;

namespace Mre.Sb.UnidadAdministrativa.Dominio
{
    public class SecuencialLibroManager : DomainService
    {
        private readonly IRepository<SecuencialLibro, Guid> sequentialBookRepository;
        private readonly IStringLocalizer<AdministrativeUnitResource> localizer;

        public SecuencialLibroManager(IRepository<SecuencialLibro, Guid> sequentialBookRepository, IStringLocalizer<AdministrativeUnitResource> localizer)
        {
            this.sequentialBookRepository = sequentialBookRepository;
            this.localizer = localizer;
        }

        public virtual async Task<SecuencialLibro> CreateAsync(Guid id, Guid administrativeUnitId, Guid serviceId, string bookId,
               int numberPageByVolume, int currentVolume, int nextPage, int year)
        {


            var queryable = await sequentialBookRepository.GetQueryableAsync();
            var existing = queryable.Any(e => e.ServicioId == serviceId && e.UnidadAdministrativaId == administrativeUnitId && e.LibroId == bookId);

            if (existing)
            {
                var msg = string.Format(localizer["SequentialBook:Exist"]);
                throw new UserFriendlyException(msg);
            }

            var entity = new SecuencialLibro(id: id, serviceId: serviceId, administrativeUnitId: administrativeUnitId, bookId: bookId, numberPageByVolume: numberPageByVolume, currentVolume: currentVolume, nextPage: nextPage, year: year);

            return entity;
        }
    }
}
