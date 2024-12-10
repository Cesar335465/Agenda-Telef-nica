const criarTabela = '''
CREATE TABLE contact(
id INTEGER NOT NULL PRIMARY KEY
,nome VARCHAR(200) NOT NULL
,telefone VARCHAR(16) NOT NULL
,email VARCHAR(200) NOT NULL
)
''';

const inserir1 = '''
  INSERT INTO contact(nome, telefone, email)
  VALUES('João','(64)9 9876-5432','joao@gmail.com')
''';

const inserir2 = '''
  INSERT INTO contact(nome, telefone, email)
  VALUES('Jéssica','(62)9 9123-4567','jessica@icloud.com')
''';

const inserir3 = '''
  INSERT INTO contact(nome, telefone, email)
  VALUES('César','(64)9 9219-9896','cesar@gmail.com')
''';
