package com.example.springboot.controller;

import cn.hutool.core.date.DateUtil;
import cn.hutool.poi.excel.ExcelUtil;
import cn.hutool.poi.excel.ExcelReader;
import cn.hutool.poi.excel.ExcelWriter;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletOutputStream;
import java.net.URLEncoder;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.springboot.entity.Arriveschool;
import org.springframework.web.bind.annotation.*;
import javax.annotation.Resource;
import java.io.InputStream;
import java.util.List;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.springboot.common.Result;
import org.springframework.web.multipart.MultipartFile;
import com.example.springboot.entity.User;
import com.example.springboot.utils.TokenUtils;
import com.example.springboot.service.IUserService;

import com.example.springboot.service.IDormrepairService;
import com.example.springboot.entity.Dormrepair;

import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author
 *
 */
@RestController
@RequestMapping("/dormrepair")
public class DormrepairController {

    @Resource
    private IDormrepairService dormrepairService;
    @Resource
    IUserService userService;

    private final String now = DateUtil.now();

    // 新增或者更新
    @PostMapping
    public Result save(@RequestBody Dormrepair dormrepair) {
        if (dormrepair.getId() == null) {
            Integer userid = dormrepair.getUserid();
            User byId = userService.getById(userid);
            if("未住宿".equals(byId.getIsdorm())){
                return Result.error("400","你还没有住宿信息，无法报修");
            }
            dormrepair.setUsername(byId.getUsername());
            dormrepair.setAddress(byId.getDormaddress());
        }
        dormrepairService.saveOrUpdate(dormrepair);
        return Result.success();
    }

    @DeleteMapping("/{id}")
    public Result delete(@PathVariable Integer id) {
        dormrepairService.removeById(id);
        return Result.success();
    }

    @PostMapping("/del/batch")
    public Result deleteBatch(@RequestBody List<Integer> ids) {
        dormrepairService.removeByIds(ids);
        return Result.success();
    }

    @GetMapping
    public Result findAll() {
        return Result.success(dormrepairService.list());
    }

    @GetMapping("/{id}")
    public Result findOne(@PathVariable Integer id) {
        return Result.success(dormrepairService.getById(id));
    }

    @GetMapping("/page")
    public Result findPage(@RequestParam(defaultValue = "") String name,
                           @RequestParam Integer pageNum,
                           @RequestParam Integer userid,
                           @RequestParam Integer pageSize) {
        QueryWrapper<Dormrepair> queryWrapper = new QueryWrapper<>();
        queryWrapper.orderByDesc("id");
        if (!"".equals(name)) {
            queryWrapper.like("name", name);
        }
        if(-1 != userid){
            queryWrapper.eq("userid",userid);
        }
//        User currentUser = TokenUtils.getCurrentUser();
//        if (currentUser.getRole().equals("ROLE_USER")) {
//            queryWrapper.eq("userid", currentUser.getId());
//        }
        return Result.success(dormrepairService.page(new Page<>(pageNum, pageSize), queryWrapper));
    }
    @GetMapping("/finish")
    public Result finish(@RequestParam Integer id) {
        QueryWrapper<Dormrepair> queryWrapper = new QueryWrapper<>();
        Dormrepair byId = dormrepairService.getById(id);
        if(byId != null){
            byId.setRepairstatus("维修完成");
            dormrepairService.updateById(byId);
            return Result.success("维修完成");
        }else{
            return Result.error("400","不存在数据，无法维修完成");
        }
    }

    @GetMapping("/agree")
    public Result agree(@RequestParam Integer id) {
        QueryWrapper<Arriveschool> queryWrapper = new QueryWrapper<>();
        Dormrepair byId = dormrepairService.getById(id);
        if(byId != null){
            byId.setRepairstatus("维修中");
            dormrepairService.updateById(byId);
            return Result.success("审核通过");
        }else{
            return Result.error("400","不存在数据，无法审核");
        }
    }
    @GetMapping("/reject")
    public Result reject(@RequestParam Integer id) {
        QueryWrapper<Arriveschool> queryWrapper = new QueryWrapper<>();
        Dormrepair byId = dormrepairService.getById(id);
        if(byId != null){
            byId.setRepairstatus("审核拒绝");
            dormrepairService.updateById(byId);
            return Result.success("审核拒绝");
        }else{
            return Result.error("400","不存在数据，无法审核");
        }
    }

    /**
    * 导出接口
    */
    @GetMapping("/export")
    public void export(HttpServletResponse response) throws Exception {
        // 从数据库查询出所有的数据
        List<Dormrepair> list = dormrepairService.list();
        // 在内存操作，写出到浏览器
        ExcelWriter writer = ExcelUtil.getWriter(true);

        // 一次性写出list内的对象到excel，使用默认样式，强制输出标题
        writer.write(list, true);

        // 设置浏览器响应的格式
        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;charset=utf-8");
        String fileName = URLEncoder.encode("Dormrepair信息表", "UTF-8");
        response.setHeader("Content-Disposition", "attachment;filename=" + fileName + ".xlsx");

        ServletOutputStream out = response.getOutputStream();
        writer.flush(out, true);
        out.close();
        writer.close();

        }

    /**
     * excel 导入
     * @param file
     * @throws Exception
     */
    @PostMapping("/import")
    public Result imp(MultipartFile file) throws Exception {
        InputStream inputStream = file.getInputStream();
        ExcelReader reader = ExcelUtil.getReader(inputStream);
        // 通过 javabean的方式读取Excel内的对象，但是要求表头必须是英文，跟javabean的属性要对应起来
        List<Dormrepair> list = reader.readAll(Dormrepair.class);

        dormrepairService.saveBatch(list);
        return Result.success();
    }

    private User getUser() {
        return TokenUtils.getCurrentUser();
    }

}

