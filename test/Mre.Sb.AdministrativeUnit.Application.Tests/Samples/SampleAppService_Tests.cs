﻿//using System.Threading.Tasks;
//using Shouldly;
//using Xunit;

//namespace Mre.Sb.UnidadAdministrativa.Samples
//{
//    public class SampleAppService_Tests : AdministrativeUnitApplicationTestBase
//    {
//        private readonly ISampleAppService _sampleAppService;

//        public SampleAppService_Tests()
//        {
//            _sampleAppService = GetRequiredService<ISampleAppService>();
//        }

//        [Fact]
//        public async Task GetAsync()
//        {
//            var result = await _sampleAppService.GetAsync();
//            result.Valor.ShouldBe(42);
//        }

//        [Fact]
//        public async Task GetAuthorizedAsync()
//        {
//            var result = await _sampleAppService.GetAuthorizedAsync();
//            result.Valor.ShouldBe(42);
//        }
//    }
//}
