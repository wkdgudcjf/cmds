package com.cmds.web.config;

import com.zaxxer.hikari.HikariDataSource;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.sql.DataSource;

@Configuration
@MapperScan(basePackages = "com.cmds.web.msmapper", sqlSessionFactoryRef="mssqlCmdsSessionFactory", annotationClass = MssqlDatasourceSelector.Cmds.class)
public class MssqlCmdsConfig {
    @Bean(name = "mssqlCmdsDatasource")
    @ConfigurationProperties(prefix = "spring.mssql.cmds.datasource")
    public DataSource dataSource() {
        HikariDataSource hikariDataSource = DataSourceBuilder.create().type(HikariDataSource.class).build();
        hikariDataSource.setMinimumIdle(24);
        hikariDataSource.setMaximumPoolSize(24);
        hikariDataSource.setConnectionTestQuery("SELECT 1");
        return hikariDataSource;
    }

    @Bean(name = "mssqlCmdsSessionFactory")
    public SqlSessionFactory sqlSessionFactory(@Qualifier("mssqlCmdsDatasource") DataSource MsDataSource, ApplicationContext applicationContext) throws Exception {
        SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
        sqlSessionFactoryBean.setDataSource(MsDataSource);
        sqlSessionFactoryBean.setMapperLocations(applicationContext.getResources("classpath:com/cmds/web/msmapper/*.xml"));
        return sqlSessionFactoryBean.getObject();
    }

    @Bean(name = "mssqlCmdsSessionTemplate")
    public SqlSessionTemplate sqlSessionTemplate(SqlSessionFactory MsSqlSessionFactory) throws Exception {
        return new SqlSessionTemplate(MsSqlSessionFactory);
    }
}
