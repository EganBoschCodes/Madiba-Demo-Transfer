from snap_adt_client import *
import asyncio, pprint, os
from dotenv import load_dotenv, dotenv_values
load_dotenv()
ENV = dotenv_values()

async def main():
    # Establish a connection to the SAP system.
    client = AdtHTTP(config=ConnectionConfig(
        connection_type=ConnectionType.BASIC,
        client_id='MadibaDemo-DM1-200',
        credentials=Credentials(
            username=ENV["USERNAME"],
            password=ENV["PASSWORD"],
        )
    ))
    login_response = await client.login()
    if not login_response.success:
        print(login_response.context)
        exit(1)
    print("Login successful")

    # Extract all views from the main package.
    read_response = await client.read_folder(package_name=ENV["SNAP-Package"], return_types=[ConfiguredObjTypes.VIEW])
    successes = [res.context for res in read_response if res.success]
    failures = sum([1 for res in read_response if not res.success])
    print(f"Read {len(successes)} successful and {failures} failed responses")

    # Clear the views folder.
    views_folder = "views"
    os.makedirs(views_folder, exist_ok=True)
    for filename in os.listdir(views_folder):
        file_path = os.path.join(views_folder, filename)
        if not os.path.isfile(file_path):
            continue
        os.remove(file_path)

    # Write the views to files.
    for view_object in successes:
        view_file = os.path.join(views_folder, f"{view_object.name}.{view_object.extension}")
        with open(view_file, 'w') as f:
            f.write(view_object.content)

asyncio.run(main())