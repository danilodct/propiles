package br.com.profisio.basics;

import java.util.Date;

import br.com.profisio.basics.enums.EstadoCivil;
import br.com.profisio.basics.enums.Sexo;
import br.com.profisio.util.SystemUtils;

public class Pessoa extends ObjetoBasico {

	private String nome;
	private Sexo sexo;
	private EstadoCivil estadoCivil;
	private String cpf;
	private String email;
	private String niver;
	private Date dataNascimento;
	private String foneFixo;
	private String foneCelular;
	private Endereco endereco;

	public Pessoa() {
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public Sexo getSexo() {
		return sexo;
	}

	public String getSexoStr() {
		String sexoStr = "";
		if (this.sexo != null)
			sexoStr = sexo.getValue();
		return sexoStr;
	}

	public void setSexo(Sexo sexo) {
		this.sexo = sexo;
	}

	public void setSexoStr(String sexo) {
		this.sexo = Sexo.createEnum(sexo);
	}

	public EstadoCivil getEstadoCivil() {
		return estadoCivil;
	}

	public String getEstadoCivilStr() {
		String estadoCivilStr = "";
		if (this.estadoCivil != null)
			estadoCivilStr = estadoCivil.getValue();
		return estadoCivilStr;
	}

	public void setEstadoCivil(EstadoCivil estadoCivil) {
		this.estadoCivil = estadoCivil;
	}

	public void setEstadoCivilStr(String estadoCivil) {
		this.estadoCivil = EstadoCivil.createEnum(estadoCivil);
	}

	public String getCpf() {
		return cpf;
	}

	public void setCpf(String cpf) {
		this.cpf = cpf;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getDataNascimento() {
		return dataNascimento;
	}

	public String getDataNascimentoStr() {
		return SystemUtils.parseDataToString(dataNascimento);
	}

	public void setDataNascimento(Date dataNascimento) {
		this.dataNascimento = dataNascimento;
	}

	public void setDataNascimentoStr(String dataNascimento) {
		this.dataNascimento = SystemUtils.parseStringToDate(dataNascimento);
	}

	public String getFoneFixo() {
		return foneFixo;
	}

	public void setFoneFixo(String foneFixo) {
		this.foneFixo = foneFixo;
	}

	public String getFoneCelular() {
		return foneCelular;
	}

	public void setFoneCelular(String foneCelular) {
		this.foneCelular = foneCelular;
	}

	public Endereco getEndereco() {
		return endereco;
	}

	public void setEndereco(Endereco endereco) {
		this.endereco = endereco;
	}

	public String getNiver() {
		return niver;
	}

	public void setNiver(String niver) {
		this.niver = niver;
	}

}
