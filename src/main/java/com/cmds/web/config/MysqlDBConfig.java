package com.cmds.web.config;

import javax.sql.DataSource;

import com.zaxxer.hikari.HikariDataSource;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;

@Configuration
@MapperScan(value="com.cmds.web.mymapper", sqlSessionFactoryRef="MySqlSessionFactory")
public class MysqlDBConfig {
    @Bean(name = "MysqlDataSource")
    @Primary
    @ConfigurationProperties(prefix = "spring.mysql.datasource")
    public DataSource db1DataSource() {
        HikariDataSource hikariDataSource = DataSourceBuilder.create().type(HikariDataSource.class).build();
        hikariDataSource.setMinimumIdle(24);
        hikariDataSource.setMaximumPoolSize(24);
        hikariDataSource.setConnectionTestQuery("SELECT 1");
        return hikariDataSource;

    }

    @Bean(name = "MySqlSessionFactory")
    @Primary
    public SqlSessionFactory MySqlSessionFactory(@Qualifier("MysqlDataSource") DataSource MyDataSource, ApplicationContext applicationContext) throws Exception {

        SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
        sqlSessionFactoryBean.setDataSource(MyDataSource);
        sqlSessionFactoryBean.setMapperLocations(applicationContext.getResources("classpath:com/cmds/web/mymapper/*.xml"));
        return sqlSessionFactoryBean.getObject();
    }

    @Bean(name = "MySqlSessionTemplate")
    @Primary
    public SqlSessionTemplate MySqlSessionTemplate(SqlSessionFactory db1SqlSessionFactory) throws Exception { 
        return new SqlSessionTemplate(db1SqlSessionFactory);
    }
}
