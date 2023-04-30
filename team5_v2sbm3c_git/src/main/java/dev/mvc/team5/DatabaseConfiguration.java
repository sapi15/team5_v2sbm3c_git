package dev.mvc.team5;

import javax.sql.DataSource;

import org.mybatis.spring.annotation.MapperScan;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

@Configuration
@PropertySource("classpath:/application.properties")  // 占쎄퐬占쎌젟 占쎈솁占쎌뵬 占쎌맄燁삼옙
@MapperScan(basePackages= {"dev.mvc.team5_v2sbm3c_git",
                           "dev.mvc.member",
                           "dev.mvc.bookgrp",
                           "dev.mvc.book",
                           "dev.mvc.contents",
                           "dev.mvc.cart",
                           "dev.mvc.myroom",
                           "dev.mvc.notice",
                           "dev.mvc.event",
                           "dev.mvc.faqgrp",
                           "dev.mvc.faq",
                           "dev.mvc.order_pay",
                           "dev.mvc.order_item",
                           "dev.mvc.qna"})
public class DatabaseConfiguration {
    
    @Autowired
    private ApplicationContext applicationContext;
    
    @Bean
    @ConfigurationProperties(prefix="spring.datasource.hikari")  // 占쎄퐬占쎌젟 占쎈솁占쎌뵬占쎌벥 占쎌젔占쎈あ占쎄텢 占쎄퐨占쎈섧 spring.datasource.hikari....
    public HikariConfig hikariConfig() {
        return new HikariConfig();
    }
    
    @Bean
    public DataSource dataSource() throws Exception{
        DataSource dataSource = new HikariDataSource(hikariConfig());
        System.out.println(dataSource.toString());  // 占쎌젟占쎄맒占쎌읅占쎌몵嚥∽옙 占쎈염野껓옙 占쎈┷占쎈�占쎈뮉筌욑옙 占쎈퉸占쎈뻻�굜遺얜굡嚥∽옙 占쎌넇占쎌뵥
        return dataSource;
    }
    
    @Bean
    public SqlSessionFactory sqlSessionFactory(DataSource dataSource) throws Exception{
        SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
        sqlSessionFactoryBean.setDataSource(dataSource);
        // "/src/main/resources/mybatis" 占쎈쨨占쎈쐭占쎌벥 占쎈솁占쎌뵬筌뤿굞�뵠 "xml"嚥∽옙 占쎄국占쎄돌占쎈뮉 占쎈솁占쎌뵬 筌띲끋釉�
        sqlSessionFactoryBean.setMapperLocations(applicationContext.getResources("classpath:/mybatis/**/*.xml"));
        
        return sqlSessionFactoryBean.getObject();
    }
    
    @Bean
    public SqlSessionTemplate sqlSessionTemplate(SqlSessionFactory sqlSessionFactory){
        return new SqlSessionTemplate(sqlSessionFactory);
    }
}
