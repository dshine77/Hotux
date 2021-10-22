package com.liuyanzhao;


import com.example.hotel.Application;
import lombok.extern.slf4j.Slf4j;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.MediaType;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultHandlers;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import static org.hamcrest.Matchers.containsString;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@Slf4j
@RunWith(SpringRunner.class)
@SpringBootTest(classes = Application.class)
public class UserControllerTest {

    @Autowired
    private WebApplicationContext webApplicationContext;
    private MockMvc mockMvc;

    @Before
    public void setUp() {
        mockMvc = MockMvcBuilders.webAppContextSetup(webApplicationContext).build();
    }

    @Test
    public void getCustomers() throws Exception {
        mockMvc.perform(get("/post/1")
                .accept(MediaType.APPLICATION_JSON_UTF8))
                .andExpect(status().isOk());
                //.andExpect(content().string(containsString("\"postTitle\":\"酒店设计理念，采用白色极简主义风格，创造空间流动性与开放性，让视觉艺术与空间浑然一体\"")));
    }

    @Test
    public void testIndex() throws Exception {
        /*
         * 1、mockMvc.perform执行一个请求。
         * 2、MockMvcRequestBuilders.get("XXX")构造一个请求。
         * 3、ResultActions.param添加请求传值
         * 4、ResultActions.accept(MediaType.TEXT_HTML_VALUE))设置返回类型
         * 5、ResultActions.andExpect添加执行完成后的断言。
         * 6、ResultActions.andDo添加一个结果处理器，表示要对结果做点什么事情
         *   比如此处使用MockMvcResultHandlers.print()输出整个响应结果信息。
         * 7、ResultActions.andReturn表示执行完成后返回相应的结果。
         */
        mockMvc.perform(MockMvcRequestBuilders
                .get("/")
                // 设置返回值类型为utf-8，否则默认为ISO-8859-1
                .accept(MediaType.APPLICATION_JSON_UTF8_VALUE)
                .param("page", "1"))
                .andExpect(MockMvcResultMatchers.status().isOk())
                //.andExpect(MockMvcResultMatchers.content().string("Hello Tom!"))
                .andDo(MockMvcResultHandlers.print());
    }


}