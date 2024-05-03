import os
import PIL.Image
from dotenv import load_dotenv
import streamlit as st
import google.generativeai as genia
load_dotenv()

genia.configure(api_key=os.getenv('GOOGLE_API_KEY'))

# function to load geminal pro and get response
model = genia.GenerativeModel("gemini-pro-vision")


def get_gimani_response(input, image):
    if input != '':
        response = model.generate_content([input, image])
    else:
        response = model.generate_content(image)

    return response.text


st.set_page_config(page_title="Image to text Demo")
st.header("Germini application")
input = st.text_input('input prompt', key="input")

file_upload = st.file_uploader(
    "Choose you file ...", type=['jpg', 'jpeg', 'jpn'])

if file_upload is not None:
    image = PIL.Image.open(file_upload)

    st.image(image, caption="Upload Image", use_column_width=True)


submit = st.button("Tell me about the image")

if submit:
    response = get_gimani_response(input, image)
    st.subheader("The Response is ...")

    st.write(response)
