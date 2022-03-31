﻿using Mre.Sb.UnidadAdministrativa.Dominio;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;
using Volo.Abp.Application.Dtos;

namespace Mre.Sb.UnidadAdministrativa.Servicio
{
    public class EntidadAuspicianteDto : IEntityDto<string>
    {
        [Required]
        [StringLength(DomainCommonConsts.MaxIdLength)]
        [RegularExpression(DomainCommonConsts.ExpressionRegular.Alfanumericos)]
        public string Id { get; set; }

        [Required]
        [StringLength(DomainCommonConsts.MaxNameLength)]
        public string Nombre { get; set; }
    }

    public class EntidadAuspicianteLookupDto : EntityDto<string>
    {
        public string Nombre { get; set; }
    }
}
