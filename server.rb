require 'sinatra'
require_relative 'cell'

$mundo = {
  nabu: {
    start: 'af1',
    af1: Celda.new('af1', 'ach', 'rti', 'zlm', 'nac', 'linterna', true, 'a'),
    sacrificio_hecho: false,
    password: 'a'
  },

  julian: {
    start: 'af1',
    af1: Celda.new('af1', 'ach',   nil, nil, nil, nil,       false, nil ),
    ach: Celda.new('ach', 'rti', 'af1', nil, nil, 'linterna', false, nil ),
    rti: Celda.new('rti', 'zlm', 'ach', nil, nil, nil,       false, 'i' ),
    zlm: Celda.new('zlm', 'nac', 'rti', nil, nil, nil,       false, 's' ),
    nac: Celda.new('nac', nil  , 'zlm', nil, nil, nil,       true,  nil ),
    sacrificio_hecho: false,
    password: 'si'
  },

  hamurabi: {
    start: 'a1o',
    sacrificio_hecho: false,
    password: 'trabajo',
    #                        up     down   right   left    trea    pan    clue
    a1o: Celda.new('a1o',    nil,   nil,   'b2p',  nil,     nil,   false, nil ), # 1
    b2p: Celda.new('b2p',  'c3q',   nil,   nil,    'a1o',   nil,   false, 'o' ), # 2
    c3q: Celda.new('c3q',  'g2u',  'b2p', 'd4r',   nil,     nil,   false, 't' ), # 3
    d4r: Celda.new('d4r',    nil,   nil,  'e5s', 'c3q',     nil,   false, 'j' ), # 4
    e5s: Celda.new('e5s',  'f1t',   nil,   nil,  'd4r',     nil,   false, nil ), # 5
    f1t: Celda.new('f1t',    nil, 'e5s',   nil,    nil,     nil,   true,  nil ), # 6
    g2u: Celda.new('g2u',  'h3v', 'c3q',   nil,    nil,     nil,   false, nil ), # 7
    h3v: Celda.new('h3v',  'k8y', 'g2u',   nil,    nil,     nil,   false, 'r' ), # 8
    i4w: Celda.new('i4w',    nil,   nil, 'j7x',    nil,     nil,   false, 'a' ), # 9
    j7x: Celda.new('j7x',    nil,   nil, 'k8y',  'i4w',     nil,   false, nil ), #10
    k8y: Celda.new('k8y',    nil, 'h3v', 'm9z',  'j7x', 'hacha',   false, nil ), #11
    m9z: Celda.new('m9z',    nil,   nil, 'n3a',  'k8y',     nil,   false, 'a' ), #12
    n3a: Celda.new('n3a',    nil,   nil,   nil,  'm9z',     nil,   false, 'b' ), #13
  },

  sargon: {
    start: 'a1o',
    sacrificio_hecho: false,
    password: 'tiempos',
    #                        up     down   right   left    trea    pan    clue
    a1o: Celda.new('a1o',    nil,   nil,   'b2p',  nil,     nil,   false, nil ), # 1
    b2p: Celda.new('b2p',  'c3q',   nil,   nil,    'a1o',   nil,   false, 't' ), # 2
    c3q: Celda.new('c3q',  'g2u',  'b2p', 'd4r',   nil,     nil,   false, 'o' ), # 3
    d4r: Celda.new('d4r',    nil,   nil,  'e5s', 'c3q',     nil,   false, 'i' ), # 4
    e5s: Celda.new('e5s',  'f1t',   nil,   nil,  'd4r',     nil,   false, nil ), # 5
    f1t: Celda.new('f1t',    nil, 'e5s',   nil,    nil,     nil,   true,  nil ), # 6
    g2u: Celda.new('g2u',  'h3v', 'c3q',   nil,    nil,     nil,   false, nil ), # 7
    h3v: Celda.new('h3v',  'k8y', 'g2u',   nil,    nil,     nil,   false, 'p' ), # 8
    i4w: Celda.new('i4w',    nil,   nil, 'j7x',    nil,     nil,   false, 'e' ), # 9
    j7x: Celda.new('j7x',    nil,   nil, 'k8y',  'i4w',     nil,   false, nil ), #10
    k8y: Celda.new('k8y',    nil, 'h3v', 'm9z',  'j7x', 'sierra',  false, nil ), #11
    m9z: Celda.new('m9z',    nil,   nil, 'n3a',  'k8y',     nil,   false, 'm' ), #12
    n3a: Celda.new('n3a',    nil,   nil,   nil,  'm9z',     nil,   false, 's' ), #13
  },

  tiglatpileser: {
    start: 'a1o',
    sacrificio_hecho: false,
    password: 'persona',
    #                        up     down   right   left    trea    pan    clue
    a1o: Celda.new('a1o',    nil,   nil,   'b2p',  nil,     nil,   false, nil ), # 1
    b2p: Celda.new('b2p',  'c3q',   nil,   nil,    'a1o',   nil,   false, 'a' ), # 2
    c3q: Celda.new('c3q',  'g2u',  'b2p', 'd4r',   nil,     nil,   false, 'p' ), # 3
    d4r: Celda.new('d4r',    nil,   nil,  'e5s', 'c3q',     nil,   false, 'n' ), # 4
    e5s: Celda.new('e5s',  'f1t',   nil,   nil,  'd4r',     nil,   false, nil ), # 5
    f1t: Celda.new('f1t',    nil, 'e5s',   nil,    nil,     nil,   true,  nil ), # 6
    g2u: Celda.new('g2u',  'h3v', 'c3q',   nil,    nil,     nil,   false, nil ), # 7
    h3v: Celda.new('h3v',  'k8y', 'g2u',   nil,    nil,     nil,   false, 'e' ), # 8
    i4w: Celda.new('i4w',    nil,   nil, 'j7x',    nil,     nil,   false, 'o' ), # 9
    j7x: Celda.new('j7x',    nil,   nil, 'k8y',  'i4w',     nil,   false, nil ), #10
    k8y: Celda.new('k8y',    nil, 'h3v', 'm9z',  'j7x', 'manto',   false, nil ), #11
    m9z: Celda.new('m9z',    nil,   nil, 'n3a',  'k8y',     nil,   false, 'r' ), #12
    n3a: Celda.new('n3a',    nil,   nil,   nil,  'm9z',     nil,   false, 's' ), #13
  },

  nabopolasar: {
    start: 'a1o',
    sacrificio_hecho: false,
    password: 'familia',
    #                        up     down   right   left    trea    pan    clue
    a1o: Celda.new('a1o',    nil,   nil,   'b2p',  nil,     nil,   false, nil ), # 1
    b2p: Celda.new('b2p',  'c3q',   nil,   nil,    'a1o',   nil,   false, 'f' ), # 2
    c3q: Celda.new('c3q',  'g2u',  'b2p', 'd4r',   nil,     nil,   false, 'i' ), # 3
    d4r: Celda.new('d4r',    nil,   nil,  'e5s', 'c3q',     nil,   false, 'a' ), # 4
    e5s: Celda.new('e5s',  'f1t',   nil,   nil,  'd4r',     nil,   false, nil ), # 5
    f1t: Celda.new('f1t',    nil, 'e5s',   nil,    nil,     nil,   true,  nil ), # 6
    g2u: Celda.new('g2u',  'h3v', 'c3q',   nil,    nil,     nil,   false, nil ), # 7
    h3v: Celda.new('h3v',  'k8y', 'g2u',   nil,    nil,     nil,   false, 'i' ), # 8
    i4w: Celda.new('i4w',    nil,   nil, 'j7x',    nil,     nil,   false, 'm' ), # 9
    j7x: Celda.new('j7x',    nil,   nil, 'k8y',  'i4w',     nil,   false, nil ), #10
    k8y: Celda.new('k8y',    nil, 'h3v', 'm9z',  'j7x', 'navaja',  false, nil ), #11
    m9z: Celda.new('m9z',    nil,   nil, 'n3a',  'k8y',     nil,   false, 'a' ), #12
    n3a: Celda.new('n3a',    nil,   nil,   nil,  'm9z',     nil,   false, 'l' ), #13
  },

  asurbanipal: {
    start: 'a1o',
    sacrificio_hecho: false,
    password: 'sistema',
    #                        up     down   right   left    trea    pan    clue
    a1o: Celda.new('a1o',    nil,   nil,   'b2p',  nil,     nil,   false, nil ), # 1
    b2p: Celda.new('b2p',  'c3q',   nil,   nil,    'a1o',   nil,   false, 'a' ), # 2
    c3q: Celda.new('c3q',  'g2u',  'b2p', 'd4r',   nil,     nil,   false, 's' ), # 3
    d4r: Celda.new('d4r',    nil,   nil,  'e5s', 'c3q',     nil,   false, 'e' ), # 4
    e5s: Celda.new('e5s',  'f1t',   nil,   nil,  'd4r',     nil,   false, nil ), # 5
    f1t: Celda.new('f1t',    nil, 'e5s',   nil,    nil,     nil,   true,  nil ), # 6
    g2u: Celda.new('g2u',  'h3v', 'c3q',   nil,    nil,     nil,   false, nil ), # 7
    h3v: Celda.new('h3v',  'k8y', 'g2u',   nil,    nil,     nil,   false, 'i' ), # 8
    i4w: Celda.new('i4w',    nil,   nil, 'j7x',    nil,     nil,   false, 'm' ), # 9
    j7x: Celda.new('j7x',    nil,   nil, 'k8y',  'i4w',     nil,   false, nil ), #10
    k8y: Celda.new('k8y',    nil, 'h3v', 'm9z',  'j7x', 'pertiga', false, nil ), #11
    m9z: Celda.new('m9z',    nil,   nil, 'n3a',  'k8y',     nil,   false, 's' ), #12
    n3a: Celda.new('n3a',    nil,   nil,   nil,  'm9z',     nil,   false, 't' ), #13
  },

  nabonido: {
    start: 'a1o',
    sacrificio_hecho: false,
    password: 'empresa',
    #                        up     down   right   left    trea    pan    clue
    a1o: Celda.new('a1o',    nil,   nil,   'b2p',  nil,     nil,   false, nil ), # 1
    b2p: Celda.new('b2p',  'c3q',   nil,   nil,    'a1o',   nil,   false, 'e' ), # 2
    c3q: Celda.new('c3q',  'g2u',  'b2p', 'd4r',   nil,     nil,   false, 'a' ), # 3
    d4r: Celda.new('d4r',    nil,   nil,  'e5s', 'c3q',     nil,   false, 'm' ), # 4
    e5s: Celda.new('e5s',  'f1t',   nil,   nil,  'd4r',     nil,   false, nil ), # 5
    f1t: Celda.new('f1t',    nil, 'e5s',   nil,    nil,     nil,   true,  nil ), # 6
    g2u: Celda.new('g2u',  'h3v', 'c3q',   nil,    nil,     nil,   false, nil ), # 7
    h3v: Celda.new('h3v',  'k8y', 'g2u',   nil,    nil,     nil,   false, 's' ), # 8
    i4w: Celda.new('i4w',    nil,   nil, 'j7x',    nil,     nil,   false, 'p' ), # 9
    j7x: Celda.new('j7x',    nil,   nil, 'k8y',  'i4w',     nil,   false, nil ), #10
    k8y: Celda.new('k8y',    nil, 'h3v', 'm9z',  'j7x',  'bala',   false, nil ), #11
    m9z: Celda.new('m9z',    nil,   nil, 'n3a',  'k8y',     nil,   false, 'e' ), #12
    n3a: Celda.new('n3a',    nil,   nil,   nil,  'm9z',     nil,   false, 'r' ), #13
  },

  shamshi: {
    start: 'a1o',
    sacrificio_hecho: false,
    password: 'mensaje',
    #                        up     down   right   left    trea    pan    clue
    a1o: Celda.new('a1o',    nil,   nil,   'b2p',  nil,     nil,   false, nil ), # 1
    b2p: Celda.new('b2p',  'c3q',   nil,   nil,    'a1o',   nil,   false, 'm' ), # 2
    c3q: Celda.new('c3q',  'g2u',  'b2p', 'd4r',   nil,     nil,   false, 'a' ), # 3
    d4r: Celda.new('d4r',    nil,   nil,  'e5s', 'c3q',     nil,   false, 'e' ), # 4
    e5s: Celda.new('e5s',  'f1t',   nil,   nil,  'd4r',     nil,   false, nil ), # 5
    f1t: Celda.new('f1t',    nil, 'e5s',   nil,    nil,     nil,   true,  nil ), # 6
    g2u: Celda.new('g2u',  'h3v', 'c3q',   nil,    nil,     nil,   false, nil ), # 7
    h3v: Celda.new('h3v',  'k8y', 'g2u',   nil,    nil,     nil,   false, 's' ), # 8
    i4w: Celda.new('i4w',    nil,   nil, 'j7x',    nil,     nil,   false, 'e' ), # 9
    j7x: Celda.new('j7x',    nil,   nil, 'k8y',  'i4w',     nil,   false, nil ), #10
    k8y: Celda.new('k8y',    nil, 'h3v', 'm9z',  'j7x', 'escudo',   false, nil ), #11
    m9z: Celda.new('m9z',    nil,   nil, 'n3a',  'k8y',     nil,   false, 'j' ), #12
    n3a: Celda.new('n3a',    nil,   nil,   nil,  'm9z',     nil,   false, 'n' ), #13
  },

  marduk: {
    start: 'a1o',
    sacrificio_hecho: false,
    password: 'cultura',
    #                        up     down   right   left    trea    pan    clue
    a1o: Celda.new('a1o',    nil,   nil,   'b2p',  nil,     nil,   false, nil ), # 1
    b2p: Celda.new('b2p',  'c3q',   nil,   nil,    'a1o',   nil,   false, 'c' ), # 2
    c3q: Celda.new('c3q',  'g2u',  'b2p', 'd4r',   nil,     nil,   false, 'a' ), # 3
    d4r: Celda.new('d4r',    nil,   nil,  'e5s', 'c3q',     nil,   false, 'u' ), # 4
    e5s: Celda.new('e5s',  'f1t',   nil,   nil,  'd4r',     nil,   false, nil ), # 5
    f1t: Celda.new('f1t',    nil, 'e5s',   nil,    nil,     nil,   true,  nil ), # 6
    g2u: Celda.new('g2u',  'h3v', 'c3q',   nil,    nil,     nil,   false, nil ), # 7
    h3v: Celda.new('h3v',  'k8y', 'g2u',   nil,    nil,     nil,   false, 'r' ), # 8
    i4w: Celda.new('i4w',    nil,   nil, 'j7x',    nil,     nil,   false, 'l' ), # 9
    j7x: Celda.new('j7x',    nil,   nil, 'k8y',  'i4w',     nil,   false, nil ), #10
    k8y: Celda.new('k8y',    nil, 'h3v', 'm9z',  'j7x',  'remo',   false, nil ), #11
    m9z: Celda.new('m9z',    nil,   nil, 'n3a',  'k8y',     nil,   false, 'u' ), #12
    n3a: Celda.new('n3a',    nil,   nil,   nil,  'm9z',     nil,   false, 't' ), #13
  },

  ashur: {
    start: 'a1o',
    sacrificio_hecho: false,
    password: 'momento',
    #                        up     down   right   left    trea    pan    clue
    a1o: Celda.new('a1o',    nil,   nil,   'b2p',  nil,     nil,   false, nil ), # 1
    b2p: Celda.new('b2p',  'c3q',   nil,   nil,    'a1o',   nil,   false, 'o' ), # 2
    c3q: Celda.new('c3q',  'g2u',  'b2p', 'd4r',   nil,     nil,   false, 'm' ), # 3
    d4r: Celda.new('d4r',    nil,   nil,  'e5s', 'c3q',     nil,   false, 't' ), # 4
    e5s: Celda.new('e5s',  'f1t',   nil,   nil,  'd4r',     nil,   false, nil ), # 5
    f1t: Celda.new('f1t',    nil, 'e5s',   nil,    nil,     nil,   true,  nil ), # 6
    g2u: Celda.new('g2u',  'h3v', 'c3q',   nil,    nil,     nil,   false, nil ), # 7
    h3v: Celda.new('h3v',  'k8y', 'g2u',   nil,    nil,     nil,   false, 'o' ), # 8
    i4w: Celda.new('i4w',    nil,   nil, 'j7x',    nil,     nil,   false, 'n' ), # 9
    j7x: Celda.new('j7x',    nil,   nil, 'k8y',  'i4w',     nil,   false, nil ), #10
    k8y: Celda.new('k8y',    nil, 'h3v', 'm9z',  'j7x', 'candil',  false, nil ), #11
    m9z: Celda.new('m9z',    nil,   nil, 'n3a',  'k8y',     nil,   false, 'm' ), #12
    n3a: Celda.new('n3a',    nil,   nil,   nil,  'm9z',     nil,   false, 'e' ), #13
  },

  nabuconodosor: {
    start: 'a1o',
    sacrificio_hecho: false,
    password: 'palabra',
    #                        up     down   right   left    trea    pan    clue
    a1o: Celda.new('a1o',    nil,   nil,   'b2p',  nil,     nil,   false, nil ), # 1
    b2p: Celda.new('b2p',  'c3q',   nil,   nil,    'a1o',   nil,   false, 'a' ), # 2
    c3q: Celda.new('c3q',  'g2u',  'b2p', 'd4r',   nil,     nil,   false, 'a' ), # 3
    d4r: Celda.new('d4r',    nil,   nil,  'e5s', 'c3q',     nil,   false, 'a' ), # 4
    e5s: Celda.new('e5s',  'f1t',   nil,   nil,  'd4r',     nil,   false, nil ), # 5
    f1t: Celda.new('f1t',    nil, 'e5s',   nil,    nil,     nil,   true,  nil ), # 6
    g2u: Celda.new('g2u',  'h3v', 'c3q',   nil,    nil,     nil,   false, nil ), # 7
    h3v: Celda.new('h3v',  'k8y', 'g2u',   nil,    nil,     nil,   false, 'r' ), # 8
    i4w: Celda.new('i4w',    nil,   nil, 'j7x',    nil,     nil,   false, 'l' ), # 9
    j7x: Celda.new('j7x',    nil,   nil, 'k8y',  'i4w',     nil,   false, nil ), #10
    k8y: Celda.new('k8y',    nil, 'h3v', 'm9z',  'j7x', 'estaca',  false, nil ), #11
    m9z: Celda.new('m9z',    nil,   nil, 'n3a',  'k8y',     nil,   false, 'b' ), #12
    n3a: Celda.new('n3a',    nil,   nil,   nil,  'm9z',     nil,   false, 'p' ), #13
  },

  akkad: {
    start: 'a1o',
    sacrificio_hecho: false,
    password: 'bendito',
    #                        up     down   right   left    trea    pan    clue
    a1o: Celda.new('a1o',    nil,   nil,   'b2p',  nil,     nil,   false, nil ), # 1
    b2p: Celda.new('b2p',  'c3q',   nil,   nil,    'a1o',   nil,   false, 'b' ), # 2
    c3q: Celda.new('c3q',  'g2u',  'b2p', 'd4r',   nil,     nil,   false, 'o' ), # 3
    d4r: Celda.new('d4r',    nil,   nil,  'e5s', 'c3q',     nil,   false, 'e' ), # 4
    e5s: Celda.new('e5s',  'f1t',   nil,   nil,  'd4r',     nil,   false, nil ), # 5
    f1t: Celda.new('f1t',    nil, 'e5s',   nil,    nil,     nil,   true,  nil ), # 6
    g2u: Celda.new('g2u',  'h3v', 'c3q',   nil,    nil,     nil,   false, nil ), # 7
    h3v: Celda.new('h3v',  'k8y', 'g2u',   nil,    nil,     nil,   false, 't' ), # 8
    i4w: Celda.new('i4w',    nil,   nil, 'j7x',    nil,     nil,   false, 'i' ), # 9
    j7x: Celda.new('j7x',    nil,   nil, 'k8y',  'i4w',     nil,   false, nil ), #10
    k8y: Celda.new('k8y',    nil, 'h3v', 'm9z',  'j7x', 'moneda',  false, nil ), #11
    m9z: Celda.new('m9z',    nil,   nil, 'n3a',  'k8y',     nil,   false, 'd' ), #12
    n3a: Celda.new('n3a',    nil,   nil,   nil,  'm9z',     nil,   false, 'n' ), #13
  },

  adad: {
    start: 'a1o',
    sacrificio_hecho: false,
    password: 'dilubio',
    #                        up     down   right   left    trea    pan    clue
    a1o: Celda.new('a1o',    nil,   nil,   'b2p',  nil,     nil,   false, nil ), # 1
    b2p: Celda.new('b2p',  'c3q',   nil,   nil,    'a1o',   nil,   false, 'o' ), # 2
    c3q: Celda.new('c3q',  'g2u',  'b2p', 'd4r',   nil,     nil,   false, 'd' ), # 3
    d4r: Celda.new('d4r',    nil,   nil,  'e5s', 'c3q',     nil,   false, 'i' ), # 4
    e5s: Celda.new('e5s',  'f1t',   nil,   nil,  'd4r',     nil,   false, nil ), # 5
    f1t: Celda.new('f1t',    nil, 'e5s',   nil,    nil,     nil,   true,  nil ), # 6
    g2u: Celda.new('g2u',  'h3v', 'c3q',   nil,    nil,     nil,   false, nil ), # 7
    h3v: Celda.new('h3v',  'k8y', 'g2u',   nil,    nil,     nil,   false, 'i' ), # 8
    i4w: Celda.new('i4w',    nil,   nil, 'j7x',    nil,     nil,   false, 'b' ), # 9
    j7x: Celda.new('j7x',    nil,   nil, 'k8y',  'i4w',     nil,   false, nil ), #10
    k8y: Celda.new('k8y',    nil, 'h3v', 'm9z',  'j7x', 'sextante',false, nil ), #11
    m9z: Celda.new('m9z',    nil,   nil, 'n3a',  'k8y',     nil,   false, 'l' ), #12
    n3a: Celda.new('n3a',    nil,   nil,   nil,  'm9z',     nil,   false, 'u' ), #13
  },

}

def mundo
  $mundo
end

def pintar(current_user, celda)
    <<-TEXT
      Player: #{current_user}

      Celda actual: #{celda[:nombre]}
      #{"Tesoro: #{celda[:tesoro]}" if celda[:tesoro]}
      #{"Pista: #{celda[:pista]}" if celda[:pista]}
      #{"Arriba: #{celda[:arriba]}" if celda[:arriba]}
      #{"Abajo: #{celda[:abajo]}" if celda[:abajo]}
      #{"Derecha: #{celda[:derecha]}" if celda[:derecha]}
      #{"Izquierda: #{celda[:izquierda]}" if celda[:izquierda]}

      #{"(╯°□°）╯" if celda[:fauno]}

    TEXT
end

get '/' do
  current_user = request.env['HTTP_X_PLAYER']
  if current_user.nil?
    <<-TEXT
      El laberinto del Fauno

      El Fauno, criatura fascinante que representa a todos los animales
      vivia feliz con su esposa Flora Martinez.

      Un dia, ella decidio dejarlo para perseguir una carrera en actuacion.

      El Fauno, inundado por la tristeza, decidio construir un laberinto y vivir ahi
      para que nadie lo molestara.

      Quien tenga la mala fortuna de caer en el laberinto, debera navegarlo a oscuras,
      dando un paso a la vez siguiendo pistas y direcciones que aparecen en cada celda del laberinto.

      En alguna celda del laberinto hay un tesoro que deberas guardar en tu maleta. El Fauno exige sacrificar un tesoro para poder darte paso,
      cuando encuentres al Fauno, deberas sacrificar lo que tengas en la maleta.

      Cada celda tiene un nombre y el nombre de sus vecinos, las paredes son invisibles pero ahi estan.
      Algunas celdas tinenen una pista que sirve para descifrar el acertijo que te ayudara a salir del laberinto una vez encuentres al Fauno.

      En total el laberinto tiene 13 celdas, 7 letras y 1 tesoro.
    TEXT
  else
    datos_celda = traiga(mundo, current_user, mundo[current_user.to_sym][:start])
    pintar(current_user, datos_celda)
  end
end

get '/cells/:current_cell' do |current_cell|
  current_user = request.env['HTTP_X_PLAYER']
  if current_user.nil?
    status 401
  else
    datos_celda = traiga(mundo, current_user, current_cell)
    if not datos_celda.empty?
      pintar(current_user, datos_celda)
    else
      status 404
    end
  end
end

post '/cells/:current_cell' do |current_cell|
  current_user = request.env['HTTP_X_PLAYER']
  authorization = request.env['HTTP_AUTHORIZATION']

  if current_user.nil?
    status 401
  else
    if authorization.nil?
      status 401
    else
      cell = traiga(mundo, current_user, current_cell)
      if cell[:fauno] && authorization.split(" ").last.eql?(mundo[current_user.to_sym][:password])
        status 200
        <<-TEXT
          El Fauno agradece tu visita y dado que has sacrificado todo lo que conseguiste en el laberinto
          y que lograste descifrar el ascertijo, te has ganado tu libertad.

          Ahora vete..... :'(
        TEXT
      else
        status 401
      end
    end
  end

end

post '/maleta' do
  current_user = request.env['HTTP_X_PLAYER']
  if current_user.nil?
    status 401
  else
    current_cell = request.env['HTTP_X_CURRENT']
    if current_cell.nil?
      status 400
    else
      cell = traiga(mundo, current_user, current_cell)
      request_tesoro = request.body.read.to_s
      if cell[:tesoro].eql?(request_tesoro)
        tesoro = pickup(mundo, current_user, current_cell, request_tesoro)
        mundo[current_user.to_sym][:maleta]=tesoro
        status 201
      else
        status 400
      end
    end
  end
end

get '/maleta' do
  current_user = request.env['HTTP_X_PLAYER']
  if current_user.nil?
    status 401
  else
    status 200
    "En la maleta tienes: #{mundo[current_user.to_sym][:maleta]}"
  end
end

delete '/maleta/:tesoro' do |tesoro|
  current_user = request.env['HTTP_X_PLAYER']
  if current_user.nil?
    status 401
  else
    current_cell = request.env['HTTP_X_CURRENT']
    cell = traiga(mundo, current_user, current_cell)
    if mundo[current_user.to_sym][:maleta].eql?(tesoro) && cell[:fauno]
      mundo[current_user.to_sym][:maleta]=nil
      mundo[current_user.to_sym][:sacrificio_hecho]=true
      status 200
      <<-TEXT
        Tu sacrificio ha sido bien recibido, ahora debes descifrar el acertijo
      TEXT
    else
      status 400
    end
  end
end

