import psycopg

# Connect to database
with psycopg.connect('postgresql://root:1234@localhost:5432/rinhadb', autocommit = False) as conn:

    # Open a cursor to perform database operations
    with conn.cursor() as cur:

        # Execute a command: this creates a new table
        # cur.execute("""
        #     select id, saldo, limite from clientes
        #     """)

        # Pass data to fill a query placeholders and let Psycopg perform
        # the correct conversion (no SQL injections!)
        # cur.execute(
        #     "INSERT INTO test (num, data) VALUES (%s, %s)",
        #     (100, "abc'def"))

        # Query the database and obtain data as Python objects.
        cur.execute("select id, saldo, limite from clientes")
        id, saldo, limite = cur.fetchone()

        # print(f'Id={id} precisa ser inteiro positivo.')
        # will return (1, 100, "abc'def")
        # print('id=' + str(id) + ', saldo='+str(saldo)+' limite='+str(limite)+'.')
        print(f'Id={id}, saldo={saldo}, limite={limite}.')

        # You can use `cur.fetchmany()`, `cur.fetchall()` to return a list
        # of several records, or even iterate on the cursor
        # for record in cur:
        #     print(record)

        # Make the changes to the database persistent
        # conn.commit()



###################################################################

# conn = psycopg.connect(
#     host="localhost",
#     database="rinhadb",
#     user="root",
#     password="1234")
    
# # create a cursor
# cur = conn.cursor()

# # executar select
# cur.execute('select * from clientes')

# # recuperar primeira linha e receber uma tupla
# row = cur.fetchone()

# while row is not None:
#     id, saldo, limite = row # desacoplar a tupla
#     print('id=' + str(id) + ', saldo='+str(saldo)+' limite='+str(limite)+'.')
#     row = cur.fetchone()


# # del row
# # del a
# # del b
# # del c
# # del d
# cur.close()
# # del cur


# conn.close()
# # del conn