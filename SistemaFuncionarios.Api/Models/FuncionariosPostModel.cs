using System.ComponentModel.DataAnnotations;

namespace SistemaFuncionarios.Api.Models
{
    /// <summary>
    /// POST /api/Funcionarios
    /// Modelo de dados para o serviço de cadastro de funcionario
    /// </summary>
    public class FuncionariosPostModel
    {

        [MaxLength(150, ErrorMessage = "Por favor, informe no máximo {1} caracteres.")]
        [MinLength(6, ErrorMessage = "Por favor, informe no mínimo {1} caracteres.")]
        [Required(ErrorMessage = "Por favor, informe o nome do funcionario.")]
        public string Nome { get; set; }

        [RegularExpression("^[0-9]{11}$", ErrorMessage = "Por favor, informe 11 dígitos numéricos.")]
        [Required(ErrorMessage = "Por favor, informe o Cpf do funcionario.")]
        public string Cpf { get; set; }

        [MaxLength(10, ErrorMessage = "Por favor, informe no máximo {1} caracteres.")]
        [MinLength(4, ErrorMessage = "Por favor, informe no mínimo {1} caracteres.")]
        [Required(ErrorMessage = "Por favor, informe a matrícula do funcionario.")]
        public string Matricula { get; set; }

        [Required(ErrorMessage = "Por favor, informe a data de adimissão do funcionario.")]
        public DateTime DataAdmissao { get; set; }
    }
}
