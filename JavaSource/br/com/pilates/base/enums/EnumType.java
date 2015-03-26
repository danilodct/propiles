package br.com.pilates.base.enums;

import java.io.Serializable;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.hibernate.HibernateException;
import org.hibernate.usertype.UserType;

@SuppressWarnings("unchecked")
public class EnumType<E extends Enum<E>> implements UserType {
	private Class<E> clazz = null;

	private static final int[] SQL_TYPES = { 12 };

	protected EnumType(Class<E> c) {
		this.clazz = c;
	}

	public int[] sqlTypes() {
		return SQL_TYPES;
	}

	public Class returnedClass() {
		return this.clazz;
	}

	public Object nullSafeGet(ResultSet resultSet, String[] names, Object owner) throws HibernateException, SQLException {
		String name = resultSet.getString(names[0]);
		Enum result = null;
		if (!(resultSet.wasNull())) {
			result = Enum.valueOf(this.clazz, name);
		}
		return result;
	}

	public void nullSafeSet(PreparedStatement preparedStatement, Object value, int index) throws HibernateException, SQLException {
		if (value == null)
			preparedStatement.setNull(index, 12);
		else
			preparedStatement.setString(index, ((Enum) value).name());
	}

	public Object deepCopy(Object value) throws HibernateException {
		return value;
	}

	public boolean isMutable() {
		return false;
	}

	public Object assemble(Serializable cached, Object owner) throws HibernateException {
		return cached;
	}

	public Serializable disassemble(Object value) throws HibernateException {
		return ((Serializable) value);
	}

	public Object replace(Object original, Object target, Object owner) throws HibernateException {
		return original;
	}

	public int hashCode(Object x) throws HibernateException {
		return x.hashCode();
	}

	public boolean equals(Object x, Object y) throws HibernateException {
		if (x == y) {
			return true;
		}
		if ((x == null) || (y == null)) {
			return false;
		}
		return x.equals(y);
	}
}