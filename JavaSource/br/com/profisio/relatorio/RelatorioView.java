package br.com.profisio.relatorio;

import java.io.DataOutputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.Collection;
import java.util.Date;

import br.com.profisio.basics.Cadastro;
import br.com.profisio.basics.Colaborador;
import br.com.profisio.basics.Servico;
import br.com.profisio.colaborador.ColaboradorControl;
import br.com.profisio.util.ProfisioActionSupport;
import br.com.profisio.util.SystemUtils;

public class RelatorioView extends ProfisioActionSupport {

	private static final long serialVersionUID = 4742339788981156278L;

	private final RelatorioControl controller;

	private Collection<Cadastro> clientes;
	private Date dataInicial, dataFinal;
	private Colaborador colaborador;
	private Servico servico;
	private Integer somaEfetividade = 0;
	private Double porcentagemEfetividade;
	private String tornouCliente, relatorio;

	private InputStream fileInputStream;

	public RelatorioView() {
		controller = RelatorioControl.getInstance();
	}

	public String actionExportAtividadesClientes() {
		try {
			String path = SystemUtils.getPath() + "/report.csv";
			DataOutputStream doStream = new DataOutputStream(new FileOutputStream(path));
			doStream.writeBytes(this.controller.getAtividadesClientesCSV(dataInicial, dataFinal));
			doStream.flush();
			doStream.close();
			fileInputStream = new FileInputStream(path);
		} catch (Exception e) {
			this.dealException(e);
		}
		return REDIRECT;
	}

	public String actionDRE() {
		try {
			this.relatorio = this.controller.gerarDemonstrativoResultado(dataInicial, dataFinal);
		} catch (Exception e) {
			this.dealException(e);
		}
		return REDIRECT;
	}

	public String actionEfetividade() {
		try {
			Integer somaCadastros = 0;
			this.clientes = this.controller.getNovosCadastros(dataInicial, dataFinal);
			if (this.clientes != null && this.clientes.size() > 0) {
				for (Cadastro cli : this.clientes) {
					if (cli.isVirouNovoCliente())
						this.somaEfetividade += 1;
					somaCadastros += 1;
				}
			}
			this.porcentagemEfetividade = ((double) this.somaEfetividade / somaCadastros) * 100;
		} catch (Exception e) {
			this.dealException(e);
		}
		return REDIRECT;
	}

	public String actionExportEfetividade() {
		try {
			String path = SystemUtils.getPath() + "/report_efetividade.csv";
			DataOutputStream doStream = new DataOutputStream(new FileOutputStream(path));
			doStream.writeBytes(this.controller.getNovosCadastrosCSV(dataInicial, dataFinal));
			doStream.flush();
			doStream.close();
			fileInputStream = new FileInputStream(path);
		} catch (Exception e) {
			this.dealException(e);
		}
		return REDIRECT;
	}

	public String actionFrequentes() {
		try {
			this.clientes = this.controller.getClientesFrequentes(dataInicial, dataFinal, colaborador, servico);
		} catch (Exception e) {
			this.dealException(e);
		}
		return REDIRECT;
	}

	// 888888888888888888888888888888888888888888888888888888888888888888888888888888

	public Collection<Colaborador> getAllColaboradores() {
		return ColaboradorControl.getInstance().getColaboradores(null);
	}

	// 888888888888888888888888888888888888888888888888888888888888888888888888888888

	public String getDataInicialStr() {
		return SystemUtils.parseDataToString(dataInicial);
	}

	public void setDataInicialStr(String dataInicial) {
		this.dataInicial = SystemUtils.parseStringToDate(dataInicial);
	}

	public String getDataFinalStr() {
		return SystemUtils.parseDataToString(dataFinal);
	}

	public void setDataFinalStr(String dataFinal) {
		this.dataFinal = SystemUtils.parseStringToDate(dataFinal);
	}

	public Collection<Cadastro> getClientes() {
		return clientes;
	}

	public void setClientes(Collection<Cadastro> clientes) {
		this.clientes = clientes;
	}

	public Colaborador getColaborador() {
		return colaborador;
	}

	public void setColaborador(Colaborador colaborador) {
		this.colaborador = colaborador;
	}

	public Servico getServico() {
		return servico;
	}

	public void setServico(Servico servico) {
		this.servico = servico;
	}

	public Integer getSomaEfetividade() {
		return somaEfetividade;
	}

	public String getPorcentagemEfetividade() {
		return SystemUtils.parseDoubleToString(porcentagemEfetividade);
	}

	public String getTornouCliente() {
		return tornouCliente;
	}

	public void setTornouCliente(String tornouCliente) {
		this.tornouCliente = tornouCliente;
	}

	public String getRelatorio() {
		return relatorio;
	}

	public void setRelatorio(String relatorio) {
		this.relatorio = relatorio;
	}

	public InputStream getFileInputStream() {
		return fileInputStream;
	}

	public void setFileInputStream(InputStream fileInputStream) {
		this.fileInputStream = fileInputStream;
	}

}
