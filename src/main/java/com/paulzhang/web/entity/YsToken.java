package com.paulzhang.web.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import lombok.*;

@EqualsAndHashCode(callSuper = true)
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@TableName("ys_token")
public class YsToken extends Model<YsToken> {

	@TableId(type = IdType.AUTO, value = "TOKEN_ID")
	private Integer tokenId;
	@TableField(value = "ACCESS_TOKEN")
	private String accessToken;
	@TableField(value = "EXPIRE_TIME")
	private Long expireTime;
}
