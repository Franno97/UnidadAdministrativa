//using Microsoft.EntityFrameworkCore;
//using Mre.Sb.UnidadAdministrativa.Dominio;
//using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Text;
//using System.Threading;
//using System.Threading.Tasks;
//using Volo.Abp.Domain.Repositories.EntityFrameworkCore;
//using Volo.Abp.EntityFrameworkCore;

//namespace Mre.Sb.AdministrativeUnit.EntityFrameworkCore
//{
//    public class UnidadAdministrativaRepository : EfCoreRepository<IUnidadAdministrativaDbContext, UnidadAdministrativa.Dominio.UnidadAdministrativa, Guid>, IUnidadAdministrativaRepository
//    {
//        public UnidadAdministrativaRepository(IDbContextProvider<IUnidadAdministrativaDbContext> dbContextProvider)
//            : base(dbContextProvider)
//        {
//        }
         
       

//        public virtual async Task<UnidadAdministrativa.Dominio.UnidadAdministrativa> ObtenerUnidadAdministrativaAsync(Guid usuarioId, CancellationToken cancellationToken = default)
//        {
//            var dbContext = await GetDbContextAsync();

//            var consulta = from unidadAdministrativa in dbContext.Set<UnidadAdministrativa.Dominio.UnidadAdministrativa>()
//                           join signatario in dbContext.Signatario
//                           on unidadAdministrativa.Id equals signatario.UnidadAdministrativaId
//                           where signatario.UsuarioId == usuarioId
//                           select unidadAdministrativa
//                           ;

//            consulta = consulta.Include(x => x.Signatarios);

//            return await consulta.SingleOrDefaultAsync(); 
//        }



//    }
//}
