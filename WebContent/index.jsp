<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>皮肤检测网站</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/nav.css">
    <link rel="stylesheet" href="css/index.css">
</head>

<body ng-app="">
    <div class="main skin-test">
        <div id="fullpage">
            <div class="index-page">
                <div ng-include="'nav.jsp'"></div>
                <div class=".contain-fluid self">
                    <div class="online-test">
                        <h3 style="color: #666;">在线肌肤测试</h3>
                    </div>
                    <div class="test-begin"><a href="javascript:void(0);" onclick="movedown()">开始测试</a></div>
                    <div class="test-icon"><a href="javascript:void(0);" onclick="movedown()"><img src="img/index-arrow.png" alt=""/></a></div>
                </div>
                <div ng-include="footer.jsp"></div>
            </div>
            <div id="question-1" class="question number">
                <div class="tableCell">
                    <div class="content-warp">
                        <h3 class="question-text">请问你的年龄是？</h3>
                        <div class="option-warp">
                            <div class="option-list">
                                <div class="option-item"><label class="label">
                                        <img src="img/q-1-o1.png" alt="">
                                        <p><svg class="icon" aria-hidden="true">
                                                <use xlink:href="#icon-30xuanzhongyuanxing"></use>
                                            </svg>A.20岁以下</p>
                                        <input type="radio" value="A">
                                    </label></div>
                                <div class="option-item"><label class="label">
                                        <img src="img/q-1-o2.png" alt="">
                                        <p><svg class="icon" aria-hidden="true">
                                                <use xlink:href="#icon-30xuanzhongyuanxing"></use>
                                            </svg>B.20-29岁</p>
                                        <input type="radio" value="B">
                                    </label></div>
                                <div class="option-item"><label class="label">
                                        <img src="img/q-1-o3.png" alt="">
                                        <p><svg class="icon" aria-hidden="true">
                                                <use xlink:href="#icon-30xuanzhongyuanxing"></use>
                                            </svg>C.30-39岁</p>
                                        <input type="radio" value="C">
                                    </label></div>
                                <div class="option-item"><label class="label">
                                        <img src="img/q-1-o4.png" alt="">
                                        <p><svg class="icon" aria-hidden="true">
                                                <use xlink:href="#icon-30xuanzhongyuanxing"></use>
                                            </svg>D.40-49岁</p>
                                        <input type="radio" value="D">
                                    </label></div>
                                <div class="option-item"><label class="label">
                                        <img src="img/q-1-o5.png" alt="">
                                        <p><svg class="icon" aria-hidden="true">
                                                <use xlink:href="#icon-30xuanzhongyuanxing"></use>
                                            </svg>E.50-59岁</p>
                                        <input type="radio" value="E">
                                    </label></div>
                                <div class="option-item"><label class="label">
                                        <img src="img/q-1-o6.png" alt="">
                                        <p><svg class="icon" aria-hidden="true">
                                                <use xlink:href="#icon-30xuanzhongyuanxing"></use>
                                            </svg>F.60岁以上</p>
                                        <input type="radio" value="F">
                                    </label></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="question-2" class="question number">
                <div class="tableCell">
                    <div class="content-warp">
                        <h3 class="question-text">最困扰您的肌肤问题是什么？<span class="block">滚动鼠标返回上一题<i class="icon-mouse" style="font-size:20px;vertical-align:middle;margin-bottom:-3px;"></i></span></h3>
                        <div class="option-warp">
                            <div class="option-list">
                                <div class="option-item"><label class="label">
                                        <img src="img/q-2-o1.png" alt="">
                                        <p><svg class="icon" aria-hidden="true">
                                                <use xlink:href="#icon-30xuanzhongyuanxing"></use>
                                            </svg>A.干燥.粗糙</p>
                                        <input type="radio" value="A">
                                    </label></div>
                                <div class="option-item"><label class="label">
                                        <img src="img/q-2-o2.png" alt="">
                                        <p><svg class="icon" aria-hidden="true">
                                                <use xlink:href="#icon-30xuanzhongyuanxing"></use>
                                            </svg>B.小皱纹</p>
                                        <input type="radio" value="A">
                                    </label></div>
                                <div class="option-item"><label class="label">
                                        <img src="img/q-2-o3.png" alt="">
                                        <p><svg class="icon" aria-hidden="true">
                                                <use xlink:href="#icon-30xuanzhongyuanxing"></use>
                                            </svg>C.皱纹</p>
                                        <input type="radio" value="A">
                                    </label></div>
                                <div class="option-item"><label class="label">
                                        <img src="img/q-2-o4.png" alt="">
                                        <p><svg class="icon" aria-hidden="true">
                                                <use xlink:href="#icon-30xuanzhongyuanxing"></use>
                                            </svg>D.松弛.无弹性</p>
                                        <input type="radio" value="A">
                                    </label></div>
                                <div class="option-item"><label class="label">
                                        <img src="img/q-2-o5.png" alt="">
                                        <p><svg class="icon" aria-hidden="true">
                                                <use xlink:href="#icon-30xuanzhongyuanxing"></use>
                                            </svg>E.色斑</p>
                                        <input type="radio" value="A">
                                    </label></div>
                                <div class="option-item"><label class="label">
                                        <img src="img/q-2-o6.png" alt="">
                                        <p><svg class="icon" aria-hidden="true">
                                                <use xlink:href="#icon-30xuanzhongyuanxing"></use>
                                            </svg>F.毛孔粗大.粉刺</p>
                                        <input type="radio" value="A">
                                    </label></div>
                                <div class="option-item"><label class="label">
                                        <img src="img/q-2-o7.png" alt="">
                                        <p><svg class="icon" aria-hidden="true">
                                                <use xlink:href="#icon-30xuanzhongyuanxing"></use>
                                            </svg>G.晦暗.暗黄</p>
                                        <input type="radio" value="A">
                                    </label></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="question-3" class="question number">
                <div class="tableCell">
                    <div class="content-warp">
                        <h3 class="question-text">您眼周肌肤的烦恼是什么？<span class="block">滚动鼠标返回上一题<i class="icon-mouse" style="font-size:20px;vertical-align:middle;margin-bottom:-3px;"></i></span></h3>
                        <div class="option-warp">
                            <div class="option-list">
                                <div class="option-item"><label class="label">
                                        <img src="img/q-3-o1.png" alt="">
                                        <p><svg class="icon" aria-hidden="true">
                                                <use xlink:href="#icon-30xuanzhongyuanxing"></use>
                                            </svg>A.黑眼圈</p>
                                        <input type="radio" value="A">
                                    </label></div>
                                <div class="option-item"><label class="label">
                                        <img src="img/q-3-o2.png" alt="">
                                        <p><svg class="icon" aria-hidden="true">
                                                <use xlink:href="#icon-30xuanzhongyuanxing"></use>
                                            </svg>B.眼周细纹</p>
                                        <input type="radio" value="A">
                                    </label></div>
                                <div class="option-item"><label class="label">
                                        <img src="img/q-3-o3.png" alt="">
                                        <p><svg class="icon" aria-hidden="true">
                                                <use xlink:href="#icon-30xuanzhongyuanxing"></use>
                                            </svg>C.眼袋</p>
                                        <input type="radio" value="A">
                                    </label></div>
                                <div class="option-item"><label class="label">
                                        <img src="img/q-3-o4.png" alt="">
                                        <p><svg class="icon" aria-hidden="true">
                                                <use xlink:href="#icon-30xuanzhongyuanxing"></use>
                                            </svg>D.浮肿</p>
                                        <input type="radio" value="A">
                                    </label></div>
                                <div class="option-item"><label class="label">
                                        <img src="img/q-3-o5.png" alt="">
                                        <p><svg class="icon" aria-hidden="true">
                                                <use xlink:href="#icon-30xuanzhongyuanxing"></use>
                                            </svg>E.完美无瑕</p>
                                        <input type="radio" value="A">
                                    </label></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="question-4" class="question number">
                <div class="tableCell">
                    <div class="content-warp">
                        <h3 class="question-text">最近，洗完脸后不涂抹任何化妆品的话？<span class="block">滚动鼠标返回上一题<i class="icon-mouse" style="font-size:20px;vertical-align:middle;margin-bottom:-3px;"></i></span></h3>
                        <div class="option-warp">
                            <div class="option-list">
                                <div class="option-item"><label class="label">
                                        <img src="img/q-4-o1.png" alt="">
                                        <p><svg class="icon" aria-hidden="true">
                                                <use xlink:href="#icon-30xuanzhongyuanxing"></use>
                                            </svg>A.面部紧绷</p>
                                        <input type="radio" value="A">
                                    </label></div>
                                <div class="option-item"><label class="label">
                                        <img src="img/q-4-o2.png" alt="">
                                        <p><svg class="icon" aria-hidden="true">
                                                <use xlink:href="#icon-30xuanzhongyuanxing"></use>
                                            </svg>B.面部水润</p>
                                        <input type="radio" value="A">
                                    </label></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="question-5" class="question number">
                <div class="tableCell">
                    <div class="content-warp">
                        <h3 class="question-text">最近，会经常感觉到？<span class="block">滚动鼠标返回上一题<i class="icon-mouse" style="font-size:20px;vertical-align:middle;margin-bottom:-3px;"></i></span></h3>
                        <div class="option-warp">
                            <div class="option-list">
                                <div class="option-item"><label class="label">
                                        <img src="img/q-5-o1.png" alt="">
                                        <p><svg class="icon" aria-hidden="true">
                                                <use xlink:href="#icon-30xuanzhongyuanxing"></use>
                                            </svg>A.额头鼻子油腻腻</p>
                                        <input type="radio" value="A">
                                    </label></div>
                                <div class="option-item"><label class="label">
                                        <img src="img/q-5-o2.png" alt="">
                                        <p><svg class="icon" aria-hidden="true">
                                                <use xlink:href="#icon-30xuanzhongyuanxing"></use>
                                            </svg>B.额头鼻子无油光，毛孔不明显</p>
                                        <input type="radio" value="A">
                                    </label></div>
                                <div class="option-item"><label class="label">
                                        <img src="img/q-5-o3.png" alt="">
                                        <p><svg class="icon" aria-hidden="true">
                                                <use xlink:href="#icon-30xuanzhongyuanxing"></use>
                                            </svg>C.额头鼻子干燥起皮</p>
                                        <input type="radio" value="A">
                                    </label></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="question-6" class="question number">
                <div class="tableCell">
                    <div class="content-warp">
                        <h3 class="question-text">素颜时您的肤色情况是什么？<span class="block">滚动鼠标返回上一题<i class="icon-mouse" style="font-size:20px;vertical-align:middle;margin-bottom:-3px;"></i></span></h3>
                        <div class="option-warp">
                            <div class="option-list">
                                <div class="option-item"><label class="label">
                                        <img src="img/q-6-o1.png" alt="">
                                        <p><svg class="icon" aria-hidden="true">
                                                <use xlink:href="#icon-30xuanzhongyuanxing"></use>
                                            </svg>A.偏红肌</p>
                                        <input type="radio" value="A">
                                    </label></div>
                                <div class="option-item"><label class="label">
                                        <img src="img/q-6-o2.png" alt="">
                                        <p><svg class="icon" aria-hidden="true">
                                                <use xlink:href="#icon-30xuanzhongyuanxing"></use>
                                            </svg>B.偏黄肌</p>
                                        <input type="radio" value="A">
                                    </label></div>
                                <div class="option-item"><label class="label">
                                        <img src="img/q-6-o3.png" alt="">
                                        <p><svg class="icon" aria-hidden="true">
                                                <use xlink:href="#icon-30xuanzhongyuanxing"></use>
                                            </svg>C.明亮肌</p>
                                        <input type="radio" value="A">
                                    </label></div>
                                <div class="option-item"><label class="label">
                                        <img src="img/q-6-o4.png" alt="">
                                        <p><svg class="icon" aria-hidden="true">
                                                <use xlink:href="#icon-30xuanzhongyuanxing"></use>
                                            </svg>D.自然肌</p>
                                        <input type="radio" value="A">
                                    </label></div>
                                <div class="option-item"><label class="label">
                                        <img src="img/q-6-o5.png" alt="">
                                        <p><svg class="icon" aria-hidden="true">
                                                <use xlink:href="#icon-30xuanzhongyuanxing"></use>
                                            </svg>E.小麦肌</p>
                                        <input type="radio" value="A">
                                    </label></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="question-7" class="question number">
                <div class="tableCell">
                    <div class="content-warp">
                        <h3 class="question-text">您是？<span class="block">滚动鼠标返回上一题<i class="icon-mouse" style="font-size:20px;vertical-align:middle;margin-bottom:-3px;"></i></span></h3>
                        <div class="option-warp">
                            <div class="option-list">
                                <div class="option-item"><label class="label">
                                        <img src="img/q-7-o1.png" alt="">
                                        <p><svg class="icon" aria-hidden="true">
                                                <use xlink:href="#icon-30xuanzhongyuanxing"></use>
                                            </svg>A.劲爆辣妈</p>
                                        <input type="radio" value="A">
                                    </label></div>
                                <div class="option-item"><label class="label">
                                        <img src="img/q-7-o2.png" alt="">
                                        <p><svg class="icon" aria-hidden="true">
                                                <use xlink:href="#icon-30xuanzhongyuanxing"></use>
                                            </svg>B.旅游达人</p>
                                        <input type="radio" value="A">
                                    </label></div>
                                <div class="option-item"><label class="label">
                                        <img src="img/q-7-o3.png" alt="">
                                        <p><svg class="icon" aria-hidden="true">
                                                <use xlink:href="#icon-30xuanzhongyuanxing"></use>
                                            </svg>C.优雅白领</p>
                                        <input type="radio" value="A">
                                    </label></div>
                                <div class="option-item"><label class="label">
                                        <img src="img/q-7-o4.png" alt="">
                                        <p><svg class="icon" aria-hidden="true">
                                                <use xlink:href="#icon-30xuanzhongyuanxing"></use>
                                            </svg>D.运动健将</p>
                                        <input type="radio" value="A">
                                    </label></div>
                                <div class="option-item"><label class="label">
                                        <img src="img/q-7-o5.png" alt="">
                                        <p><svg class="icon" aria-hidden="true">
                                                <use xlink:href="#icon-30xuanzhongyuanxing"></use>
                                            </svg>E.温室花朵</p>
                                        <input type="radio" value="A">
                                    </label></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="question-8" class="question number">
                <div class="tableCell">
                    <div class="content-warp">
                        <h3 class="question-text">您希望呈现的彩妆效果是？<span class="block">滚动鼠标返回上一题<i class="icon-mouse" style="font-size:20px;vertical-align:middle;margin-bottom:-3px;"></i></span></h3>
                        <div class="option-warp">
                            <div class="option-list">
                                <div class="option-item"><label class="label">
                                        <img src="img/q-8-o1.png" alt="">
                                        <p><svg class="icon" aria-hidden="true">
                                                <use xlink:href="#icon-30xuanzhongyuanxing"></use>
                                            </svg>A.柔和印象（融合色）</p>
                                        <input type="radio" value="A">
                                    </label></div>
                                <div class="option-item"><label class="label">
                                        <img src="img/q-8-o2.png" alt="">
                                        <p><svg class="icon" aria-hidden="true">
                                                <use xlink:href="#icon-30xuanzhongyuanxing"></use>
                                            </svg>B.鲜明印象（对比色）</p>
                                        <input type="radio" value="A">
                                    </label></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="question-9" class="question number">
                <div class="tableCell">
                    <div class="content-warp">
                        <h3 class="question-text">最近，您的肌肤处于暂时性的不稳定状态吗？<span class="block" style="line-height: 48px;font-size: 32px;">（非病理过敏）</span><span class="block">滚动鼠标返回上一题<i class="icon-mouse" style="font-size:20px;vertical-align:middle;margin-bottom:-3px;"></i></span></h3>
                        <div class="option-warp">
                            <div class="option-list">
                                <div class="option-item"><label class="label">
                                        <img src="img/q-9-o1.png" alt="">
                                        <p><svg class="icon" aria-hidden="true">
                                                <use xlink:href="#icon-30xuanzhongyuanxing"></use>
                                            </svg>A.是</p>
                                        <input type="radio" value="A">
                                    </label></div>
                                <div class="option-item"><label class="label">
                                        <img src="img/q-9-o2.png" alt="">
                                        <p><svg class="icon" aria-hidden="true">
                                                <use xlink:href="#icon-30xuanzhongyuanxing"></use>
                                            </svg>B.否</p>
                                        <input type="radio" value="A">
                                    </label></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="confirmInfo" class="confirmInfo">
                <div class="tableCell">
                    <div class="content-warp">
                        <h3 class="question-text">为了准确测试出您的肤质类型<br>请确认您的信息</h3>
                        <div class="option-warp">
                            <div class="option-list">
                                <div class="option-item" id="qu-1"><label><img src="img/q-1-o1.png" alt=""><h3 style="display: block;text-align: center;font-weight: bold;">20-29岁</h3></label></div>
                                <div class="option-item" id="qu-2"><label><img src="img/q-1-o1.png" alt=""><h3 style="display: block;text-align: center;font-weight: bold;">20-29岁</h3></label></div>
                                <div class="option-item" id="qu-3"><label><img src="img/q-1-o1.png" alt=""><h3 style="display: block;text-align: center;font-weight: bold;">20-29岁</h3></label></div>
                                <div class="option-item" id="qu-4"><label><img src="img/q-1-o1.png" alt=""><h3 style="display: block;text-align: center;font-weight: bold;">20-29岁</h3></label></div>
                                <div class="option-item" id="qu-5"><label><img src="img/q-1-o1.png" alt=""><h3 style="display: block;text-align: center;font-weight: bold;">20-29岁</h3></label></div>
                                <div class="option-item" id="qu-6"><label><img src="img/q-1-o1.png" alt=""><h3 style="display: block;text-align: center;font-weight: bold;">20-29岁</h3></label></div>
                                <div class="option-item" id="qu-7"><label><img src="img/q-1-o1.png" alt=""><h3 style="display: block;text-align: center;font-weight: bold;">20-29岁</h3></label></div>
                                <div class="option-item" id="qu-8"><label><img src="img/q-1-o1.png" alt=""><h3 style="display: block;text-align: center;font-weight: bold;">20-29岁</h3></label></div>
                            </div>
                        </div>
                        <div class="row-fluid">
                            <div class="" style="text-align: center;"><button class="btn btn-pink btn-sm" data-type="reTestButton">重新测试</button>
                                <button class="btn btn-pink btn-sm" data-type="nextPageButton">全部确认</button></div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="complete">
                <div class="completecontent">
                    <h3>恭喜您已经完成了本次测试</h3>
                    <h3>您的肤质为光敏感性皮肤</h3>
                    <div class="maybe">
                        <button class="btn btn-pink">加入我们</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
            </div>
        </div>
    </div>
</body>
<script src="js/jquery-3.2.1.min.js"></script>
<script src="font-icon/iconfont.js"></script>
<script src="js/index.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/js/bootstrap.min.js"></script>
<script src="https://cdn.staticfile.org/popper.js/1.12.5/umd/popper.min.js"></script>
<script src="https://cdn.staticfile.org/angular.js/1.4.6/angular.min.js"></script>

</html>