import os 
from dotenv import load_dotenv
import streamlit as st
import google.generativeai as genia 
load_dotenv()

genia.configure(api_key=os.getenv('GOOGLE_API_KEY'))

# function to load geminal pro and get response 
model = genia.GenerativeModel("gemini-pro")

def get_gimani_response(questions):
    response = model.generate_content(questions)
    
    return response.text

# initializing our streamlit app 

st.set_page_config(page_title="Q&A Demo")
st.header("Germini application")

input=st.text_input('input', key="input")

submit= st.button("Ask the questions")

if submit:
    response = get_gimani_response(input)
    st.subheader("The response is ....")
    st.write(response)