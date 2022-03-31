using FluentValidation;

namespace Mre.Sb.UnidadAdministrativa.UnidadAdministrativa
{
    public class CrearActualizarUnidadAdministrativaDtoValidator : AbstractValidator<CrearActualizarUnidadAdministrativaDto>
    {
        public CrearActualizarUnidadAdministrativaDtoValidator()
        {

            //RuleForEach(x => x.Jurisdiccion).NotNull();
            RuleFor(x => x.Jurisdiccion).NotNull();

            RuleFor(x => x.Jurisdiccion)
              .Must(x => x.Count > 0).WithMessage("Debe existir por lo menos una jurisdicción");


          
        }
    }


}
