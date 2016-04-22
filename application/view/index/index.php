      <div class="row">
        <div class="col-lg-4 col-md-5 col-sm-8">
          <div class="list-group">
            <a href="#" class="list-group-item active">Преобразователи давления измерительные</a>
            <a href="#" class="list-group-item">Преобразователи температуры</a>
            <a href="#" class="list-group-item">Измерители-регуляторы</a>
          </div>
        </div>
        <div class="col-lg-6 col-md-5 hidden-sm">
          <div class="input-group-inline">
            <label>Введите код заказа:</label>
            <input type="text" class="form-control" placeholder="например: APC-2000/0,25/Ex/20МПа/M/K=2000м/.../BY">
          </div>
        </div>
        <div class="col-lg-2 col-md-2 col-sm-4">
          <div class="list-group">
            <a href="#" class="list-group-item active">по коду</a>
            <a href="#" class="list-group-item">по хар-кам</a>
          </div>
        </div>
      </div>
      <div class="row" id="config-param">
        <div class="col-lg-12">

        <label>Преобразователь давления измерительный</label>
<!-- equipment mode -->
        <div id="eq_mode" class="dropdown dd-mod" title="Модификация преобразователя">
          <button class="btn btn-default dropdown-toggle btn-conf" type="button" id="1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true"></button>

          <ul class="dropdown-menu" aria-labelledby="1" id="1">
            <li><a href="#">APC-2000 (AL)</a></li>
            <li><a href="#">PC-28</a></li>
            <li><a href="#">PC-50</a></li>
          </ul>

        </div>

        <span>/</span>
<!-- accuracy class -->
        <div id="accuracy" class="dropdown dd-mod" title="Класс точности">
          <button class="btn btn-default dropdown-toggle btn-conf" type="button" id="2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" disabled></button>
          <ul class="dropdown-menu" aria-labelledby="2" id="2">
<!--             <li><a href="#">0,2</a></li>
            <li><a href="#">0,25</a></li>
            <li><a href="#">0,3</a></li>
            <li><a href="#">0,4</a></li>
            <li><a href="#">0,8</a></li>
 -->          </ul>
        </div>

        <span>/</span>
<!-- special version -->
        <div id="special_version" class="dropdown dd-mod" title="Спец. исполнение">
          <button class="btn btn-default dropdown-toggle btn-conf" type="button" id="3" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" disabled></button>
          <ul class="dropdown-menu" aria-labelledby="3" id="3">
<!--             <li><a href="#">Ex</a></li>
            <li><a href="#">Exd</a></li>
            <li><a href="#">Hastelloy</a></li>
            <li><a href="#">PPD</a></li>
            <li><a href="#">T</a></li>
            <li><a href="#">VE</a></li>
            <li><a href="#">SN</a></li>
            <li><a href="#">CT</a></li>
            <li><a href="#">SQ</a></li> -->
          </ul>
        </div>


          <span>/</span>
<!-- measurement range -->
        <div id="measurement_range" class="dropdown dd-mod" title="Измерительный диапазон">
          <button class="btn btn-default dropdown-toggle btn-conf" disabled type="button" id="4" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" disabled></button>
          <ul class="dropdown-menu" aria-labelledby="4" id="4">

          </ul>
        </div>

          <span>/</span>
<!-- body type -->
        <div id="body_type" class="dropdown dd-mod" title="Исполнение корпуса">
          <button class="btn btn-default dropdown-toggle btn-conf" disabled type="button" id="5" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" disabled></button>
          <ul class="dropdown-menu" aria-labelledby="5" id="5">

          </ul>
        </div>
<!-- process connection -->
          <span>/</span>
        <div id="process_connection" class="dropdown dd-mod" title="Тип штуцера или разделителя сред">
          <button class="btn btn-default dropdown-toggle btn-conf" disabled type="button" id="6" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" disabled>
            <!-- Dropdown -->
          </button>
          <ul class="dropdown-menu" aria-labelledby="6" id="6">

          </ul>
        </div>
<!-- process connection -->
          <span>/</span>
          <select class="select-picker" title="Длина капилляра или импульсной трубки">
            <option>1000m</option>
            <option>2000m</option>
            <option>3000m</option>
          </select>
          <span>/</span>
          <select class="select-picker" title="Комплект монтажных частей">
            <option>wtf</option>
            <option>...</option>
            <option>:)</option>
          </select>
          <span>/</span>
          <select class="select-picker" title="Код страны потребителя">
            <option>BY</option>
            <option>RU</option>
            <option>CH</option>
          </select>
        </div>
        <div class="clearfix"></div>
        <button class="btn btn-primary btn-configurate">Сконфигурировать</button>
      </div>

      <div class="jumbotron">
        <h3>Здесь будут тех. хар-ки</h3>
        <p>...</p>
      </div>

      <div class="row">
        <div class="col-lg-8"></div>
        <div class="col-lg-3">
          <button class="btn btn-warning pull-right">Заказать</button>
        </div>
        <div class="col-lg-1"></div>
      </div>
