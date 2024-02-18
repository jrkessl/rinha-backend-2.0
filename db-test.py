import psycopg
import sys


def insert():
    # Connect to database
    with psycopg.connect('postgresql://root:1234@localhost:5432/rinhadb', autocommit = False) as conn:

        # Open a cursor to perform database operations
        with conn.cursor() as cur:

            cur.execute(
                "INSERT INTO clientes (saldo, limite) VALUES (%s, %s)",
                (0, 999))

            print('entre commits.')
            sys.exit()

            cur.execute(
                "INSERT INTO clientes (saldo, limite) VALUES (%s, %s)",
                (0, 999))


            conn.commit()

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
            # cur.execute("select id, saldo, limite from clientes where id > 5")

            # while True:
            #     row = cur.fetchone()
            #     print(f'cur.rowcount == {cur.rowcount}.')

            #     if row is None:
            #         break
            #     # process row
            #     id, saldo, limite = row
            #     print(f'Id={id}, saldo={saldo}, limite={limite}.')
                
            #     if cur.rowcount == 0:
            #         break


            # id, saldo, limite = cur.fetchone()
            # print(f'Id={id}, saldo={saldo}, limite={limite}.')
            # id, saldo, limite = cur.fetchone()
            # print(f'Id={id}, saldo={saldo}, limite={limite}.')
            
            # Check for EOF in cur

            # print(f'Id={id} precisa ser inteiro positivo.')
            # will return (1, 100, "abc'def")
            # print('id=' + str(id) + ', saldo='+str(saldo)+' limite='+str(limite)+'.')
            # print(f'Id={id}, saldo={saldo}, limite={limite}.')

            # You can use `cur.fetchmany()`, `cur.fetchall()` to return a list
            # of several records, or even iterate on the cursor
            # for record in cur:
            #     id, saldo, limite = cur.fetchone()
            #     print(f'Id={id}, saldo={saldo}, limite={limite}.')
            #     # print(record)

            # Make the changes to the database persistent
            # conn.commit()


def select():
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
            cur.execute("select id, saldo, limite from clientes where id > 5")

            while True:
                row = cur.fetchone()
                # print(f'cur.rowcount == {cur.rowcount}.')

                if row is None:
                    break
                # process row
                id, saldo, limite = row
                print(f'Id={id}, saldo={saldo}, limite={limite}.')
                
                if cur.rowcount == 0:
                    break


            # id, saldo, limite = cur.fetchone()
            # print(f'Id={id}, saldo={saldo}, limite={limite}.')
            # id, saldo, limite = cur.fetchone()
            # print(f'Id={id}, saldo={saldo}, limite={limite}.')
            
            # Check for EOF in cur

            
            # Exit the python application.
            # sys.exit()
            

            # print(f'Id={id} precisa ser inteiro positivo.')
            # will return (1, 100, "abc'def")
            # print('id=' + str(id) + ', saldo='+str(saldo)+' limite='+str(limite)+'.')
            # print(f'Id={id}, saldo={saldo}, limite={limite}.')

            # You can use `cur.fetchmany()`, `cur.fetchall()` to return a list
            # of several records, or even iterate on the cursor
            for record in cur:
                id, saldo, limite = cur.fetchone()
                print(f'Id={id}, saldo={saldo}, limite={limite}.')
                # print(record)

            # Make the changes to the database persistent
            # conn.commit()


select()
print('intervalo...')
insert()
print('intervalo...')
select()
