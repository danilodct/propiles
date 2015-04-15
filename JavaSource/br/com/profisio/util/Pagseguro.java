package br.com.profisio.util;

import java.math.BigDecimal;

import br.com.profisio.basics.TransacaoPagamento;
import br.com.uol.pagseguro.domain.Item;
import br.com.uol.pagseguro.domain.Sender;
import br.com.uol.pagseguro.domain.Transaction;
import br.com.uol.pagseguro.domain.checkout.Checkout;
import br.com.uol.pagseguro.enums.Currency;
import br.com.uol.pagseguro.exception.PagSeguroServiceException;
import br.com.uol.pagseguro.properties.PagSeguroConfig;
import br.com.uol.pagseguro.service.NotificationService;

public class Pagseguro {

	public TransacaoPagamento doPagamento(String idItem, String descItem, String valor, String nome, String email) {
		TransacaoPagamento transacao = null;
		Checkout checkout = new Checkout();

		Item item = new Item();
		item.setId(idItem);
		item.setDescription(descItem);
		item.setShippingCost(new BigDecimal("0.00"));
		item.setAmount(new BigDecimal(valor));
		item.setQuantity(1);
		checkout.addItem(item);

		Sender sender = new Sender();
		sender.setName(nome);
		sender.setEmail(email);
		checkout.setRedirectURL("http://www.propiles.com.br/retornoPagamento");
		checkout.setNotificationURL("http://www.propiles.com.br/atualizacaoPagamento");
		checkout.setSender(sender);

		checkout.setCurrency(Currency.BRL);

		try {
			boolean onlyCheckoutCode = false;
			String url = checkout.register(PagSeguroConfig.getAccountCredentials(), onlyCheckoutCode);
			transacao = new TransacaoPagamento();
			transacao.setUrl(url);
		} catch (PagSeguroServiceException e) {
			e.printStackTrace();
			throw new ProfisioException(ProfisioBundleUtil.ERRO_COMUNICACAO_EMPRESA_PAGAMENTO);
		}
		return transacao;
	}

	public Transaction checkTransaction(String notificationCode) {
		Transaction transaction = null;
		if (notificationCode != null) {
			try {
				transaction = NotificationService.checkTransaction(PagSeguroConfig.getAccountCredentials(), notificationCode);
			} catch (PagSeguroServiceException e) {
				e.printStackTrace();
				System.out.println("Notification Code: " + notificationCode);
				throw new ProfisioException(ProfisioBundleUtil.ERRO_ATUALIZACAO_PAGAMENTO);
			}
		}
		return transaction;
	}

}
